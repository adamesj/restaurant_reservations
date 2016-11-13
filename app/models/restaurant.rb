class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :owner
  has_many :reservations, dependent: :destroy

  has_many :favorite_restaurants
  has_many :favorited_by, through: :favorite_restaurants, source: :user

  def favorites_count
    favorited_by.count
  end
end