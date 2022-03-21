class Package < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id', inverse_of: :created_packages, optional: true

  has_many :user_package_purchases
  has_many :purchasing_users, class_name: 'User', through: :user_package_purchases

  has_many :package_analog_recipes
  has_many :analog_recipes, through: :package_analog_recipes


  def self.find_by_slug(slug)
    Package.all.filter {|pkg| pkg.slug == slug}.first
  end


  def save
    self.name = self.name.strip
    prefix = self.name =~ /\A\d+\Z/ ? '_' : ''
    slugified_name = self.name.gsub(/\s+/, '-').gsub(/[^A-Za-z0-9-]/, '').downcase

    similar = Package.all.filter {|pkg| pkg.slug.starts_with?(slugified_name)}
    if similar.length > 1 || (similar.length == 1 && similar[-1].slug =~ /.+_\d+/)
      save_index = similar[-1].slug.split('_')[-1].to_i + 1
    elsif similar.length == 1
      save_index = 1
    else
      save_index = -1
    end

    self.slug = prefix + slugified_name + (save_index > -1 ? "_#{save_index}" : '')

    super
  end

  def save!
    self.name = self.name.strip
    prefix = self.name =~ /\A\d+\Z/ ? '_' : ''
    slugified_name = self.name.gsub(/\s+/, '-').gsub(/[^A-Za-z0-9-]/, '').downcase

    similar = Package.all.filter {|pkg| pkg.slug.starts_with?(slugified_name)}
    if similar.length > 1 || (similar.length == 1 && similar[-1].slug =~ /.+_\d+/)
      save_index = similar[-1].slug.split('_')[-1].to_i + 1
    elsif similar.length == 1
      save_index = 1
    else
      save_index = -1
    end

    self.slug = prefix + slugified_name + (save_index > -1 ? "_#{save_index}" : '')

    super
  end

  def creator
    if self.creator_id.nil?
      return 'Creator unknown'
    end

    super
  end

  def as_json(options = {})
    options[:methods] ||= [:analog_recipes, :slug]

    super(options)
  end
end
