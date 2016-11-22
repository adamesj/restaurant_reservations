# == Schema Information
#
# Table name: restaurants
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  category_id :integer
#  address     :string
#  created_at  :datetime
#  updated_at  :datetime
#  longitude   :float
#  latitude    :float
#  image       :string
#

class Restaurant < ActiveRecord::Base
  attr_accessor :image

  mount_uploader :image, ImageUploader

  validates :name, presence: true

  belongs_to :user
  has_many :reservations, dependent: :destroy

  has_many :favorite_restaurants
  has_many :favorited_by, through: :favorite_restaurants, source: :user

  has_many :categorizations
  has_many :categories, through: :categorizations

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def favorites_count
    favorited_by.count
  end
end
