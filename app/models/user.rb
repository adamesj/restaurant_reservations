class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :restaurants

  has_many :favorite_restaurants
  has_many :favorites, through: :favorite_restaurants, source: :restaurant


  belongs_to :role
  before_create :set_default_role

  private
    def set_default_role
      self.role ||= Role.find_by_name('patron')
    end
end