# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text             not null
#  image       :string(255)      not null
#  latitude    :decimal(10, 6)   not null
#  longitude   :decimal(10, 6)   not null
#  created_at  :datetime
#  updated_at  :datetime
#

class City < ActiveRecord::Base
  has_many :items

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :image, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  mount_uploader :image, ImageUploader
end
