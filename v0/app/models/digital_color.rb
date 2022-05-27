class DigitalColor < ApplicationRecord
  has_one_attached :color_img

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'


  def rgba
    i = self.UID

    r = i / 256 ** 3
    i %= 256 ** 3

    g = i / 256 ** 2
    i %= 256 ** 2

    b = i / 256
    i %= 256

    a = (i / 256.0).round(2)

    [r, g, b, a]
  end

  def rgba=(arr)
    red, green, blue, alpha = arr
    r = red * 256 ** 3
    g = green * 256 ** 2
    b = blue * 256
    a = (alpha * 256).to_i - 1

    self.UID = r + g + b + a

    self.rgba
  end

  def rgb
    r, g, b, _ = self.rgba

    [r, g, b]
  end

  def rgb=(arr)
    red, green, blue = arr

    self.rgba = [red, green, blue, 1.0]

    self.rgb
  end

  def hsla
    r, g, b, a = self.rgba

    r /= 255.0
    g /= 255.0
    b /= 255.0

    min_value = [r, g, b].min
    max_value = [r, g, b].max

    l = (min_value + max_value) / 2.0

    if min_value == max_value
      s = 0.0
    elsif l <= 0.5
      s = (max_value - min_value) / (max_value + min_value)
    else
      s = (max_value - min_value) / (2.0 - max_value - min_value)
    end

    if r == max_value
      h = (g - b) / (max_value - min_value)
    elsif g == max_value
      h = 2.0 + (b - r) / (max_value - min_value)
    else
      h = 4.0 + (r - g) / (max_value - min_value)
    end

    h *= 60.0
    if h < 0.0
      h += 360.0
    end

    [h.to_i, "#{(s.round(2) * 100.0).to_i}%", "#{(l.round(2) * 100.0).to_i}%", a]
  end

  def hsla=(arr)
    h, s, l, a = arr

    if s.is_a?(String)
      s = s.split('%')[0].to_f / 100.0
    else
      s = s.to_f
      if s > 1.0
        s /= 100.0
      end
    end

    if l.is_a?(String)
      l = l.split('%')[0].to_f / 100.0
    else
      l = l.to_f
      if l > 1.0
        l /= 100.0
      end
    end

    if s == 0.0
      r = g = b = (l * 255.0).to_i
    else
      if l < 0.5
        l1 = l * (1.0 + s)
      else
        l1 = l + s - l * s
      end

      l2 = 2 * l - l1
      h /= 360.0
      r1 = h + 1.0/3.0
      if r1 > 1.0
        r1 -= 1.0
      end
      g1 = h
      b1 = h - 1.0/3.0
      if b1 < 0.0
        b1 += 1.0
      end

      r = nil
      g = nil
      b = nil

      ['r1', 'g1', 'b1'].each do |channel|
        if eval("6.0 * #{channel} < 1.0")
          eval("#{channel[0]} = #{l2} + (#{l1} - #{l2}) * 6.0 * #{channel}")
        elsif eval("2.0 * #{channel} < 1.0")
          eval("#{channel[0]} = #{l1}")
        elsif eval("3.0 * #{channel} < 2.0")
          eval("#{channel[0]} = #{l2} + (#{l1} - #{l2}) * (2.0/3.0 - #{channel}) * 6.0")
        else
          eval("#{channel[0]} = #{l2}")
        end
      end

      r *= 255.0
      g *= 255.0
      b *= 255.0
    end

    self.rgba = [r.round, g.round, b.round, a]

    self.hsla
  end

  def hsl
    h, s, l, _ = self.hsla

    [h, s, l]
  end

  def hsl=(arr)
    h, s, l = arr

    self.hsla = [h, s, l, 1.0]

    self.hsl
  end

  def cmyk
    r, g, b = self.rgb

    r /= 255.0
    g /= 255.0
    b /= 255.0

    k = 1 - [r, g, b].max
    c = (1 - r - k) / (1 - k)
    m = (1 - g - k) / (1 - k)
    y = (1 - b - k) / (1 - k)

    k = (k * 100).to_i
    c = (c * 100).to_i
    m = (m * 100).to_i
    y = (y * 100).to_i

    ["#{c}%", "#{m}%", "#{y}%", "#{k}%"]
  end

  def cmyk=(arr)
    c, m, y, k = arr

    if c.is_a?(String)
      c = c.split('%')[0].to_f
    else
      c = c.to_f
    end

    if m.is_a?(String)
      m = m.split('%')[0].to_f
    else
      m = m.to_f
    end

    if y.is_a?(String)
      y = y.split('%')[0].to_f
    else
      y = y.to_f
    end

    if k.is_a?(String)
      k = k.split('%')[0].to_f
    else
      k = k.to_f
    end

    r = (255.0 * (1 - c / 100.0) * (1 - k / 100.0)).to_i
    g = (255.0 * (1 - m / 100.0) * (1 - k / 100.0)).to_i
    b = (255.0 * (1 - y / 100.0) * (1 - k / 100.0)).to_i

    self.rgb = [r, g, b]

    self.cmyk
  end

  def hex
    self.UID.to_s(16).rjust(8, '0')
  end

  def hex=(hex_str)
    if hex_str.start_with?('#')
      hex_str = hex_str[1..-1]
    end

    if hex_str.start_with?('0x')
      hex_str = hex_str[2..-1]
    end

    hex_length = hex_str.length

    if hex_length == 3 || hex_length == 4
      hex_intermediary = []
      
      hex_length.times do |i|
        hex_intermediary.append(hex_str[i])
        hex_intermediary.append(hex_str[i])
      end

      hex_str = hex_intermediary.join('')
      hex_length *= 2
    end

    if hex_length == 6
      self.UID = (hex_str + 'ff').to_i(16)
    elsif hex_length == 8
      self.UID = hex_str.to_i(16)
    else
      raise TypeError.new 'hex value must be three, four, six or eight digits'
    end

    self.hex
  end
end
