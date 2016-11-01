class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.datetime :reserved_at
      t.text :message
      t.references :restaurant, index: true, foreign_key: true
    end
  end
end
