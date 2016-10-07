class CreateUsersPublicReservations < ActiveRecord::Migration
  def change
  	create_table :users_public_reservations do |t|
      t.integer :user_id
      t.integer :public_reservation_id
      t.timestamps null: false
    end

    add_index :users_public_reservations, :user_id
    add_index :users_public_reservations, :public_reservation_id
  end
end
