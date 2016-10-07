class CreatePrivateReservations < ActiveRecord::Migration
  def change
    create_table :private_reservations do |t|
      
      t.integer :head_count
      t.date :start_date
      t.date :end_date

      t.references :user_id, index: true, foreign_key: true
      t.references :package_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
