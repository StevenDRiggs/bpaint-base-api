class AnalogColor < ApplicationRecord
  has_one_attached :color_img

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
end
