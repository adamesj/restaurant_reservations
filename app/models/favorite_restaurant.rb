# == Schema Information
#
# Table name: favorite_restaurants
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class FavoriteRestaurant < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
end
