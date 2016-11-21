class AddPartyToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :party, :integer
  end
end
