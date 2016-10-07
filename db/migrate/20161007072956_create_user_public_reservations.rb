class CreateUserPublicReservations < ActiveRecord::Migration
  def change
    create_table :user_public_reservations do |t|

      t.timestamps null: false
    end
  end
end
