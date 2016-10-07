class CreatePrivateReservations < ActiveRecord::Migration
  def change
    create_table :private_reservations do |t|
      t.integer :package_id
      t.integer :user_id
      t.integer :head_count
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
