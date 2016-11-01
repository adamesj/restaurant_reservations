class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :owner
  has_many :reservations, dependent: :destroy
end