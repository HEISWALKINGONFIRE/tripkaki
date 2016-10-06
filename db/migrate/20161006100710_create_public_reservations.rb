class CreatePublicReservations < ActiveRecord::Migration
  def change
    create_table :public_reservations do |t|
      t.integer :package_id
      t.date :start_date
      t.date :end_date
      t.timestamps null: false
    end
  end
end
