# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text             not null
#  item_type   :string(255)      not null
#  image       :string(255)      not null
#  latitude    :decimal(10, 6)   not null
#  longitude   :decimal(10, 6)   not null
#  schedule    :datetime
#  city_id     :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Item < ActiveRecord::Base
  ITEM_TYPES = %w(SHOP ADVENTURE ADS EVENT TOURISM)

  belongs_to :city

  validates :name, presence: true, uniqueness: { scope: :city_id }
  validates :description, presence: true
  validates :item_type, presence: true, inclusion: { in: ITEM_TYPES }
  validates :image, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :city_id, presence: true

  validates :city, presence: true

  mount_uploader :image, ImageUploader
end
