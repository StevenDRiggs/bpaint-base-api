class AnalogColor < ApplicationRecord
  has_one_attached :image

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  include Sluggable
end
