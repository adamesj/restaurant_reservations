class AddAddressAndTimestampsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :address, :string
    add_column :restaurants, :created_at, :datetime
    add_column :restaurants, :updated_at, :datetime
  end
end
