# == Schema Information
#
# Table name: reservations
#
#  id            :integer          not null, primary key
#  email         :string
#  reserved_at   :datetime
#  message       :text
#  restaurant_id :integer
#  party         :integer
#

class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
end
