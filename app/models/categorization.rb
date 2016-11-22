# == Schema Information
#
# Table name: categorizations
#
#  id            :integer          not null, primary key
#  category_id   :integer
#  restaurant_id :integer
#

class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :restaurant
end
