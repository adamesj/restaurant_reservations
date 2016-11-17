class Restaurant < ActiveRecord::Base
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

  def self.search(search)
    where("name LIKE ? OR address LIKE ?", "%#{search}%", "%#{search}%")
  end
end
