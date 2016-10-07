class AddIndexToColumns < ActiveRecord::Migration
  def change
  	add_index :packages, :title
  	add_index :packages, :state
  	add_index :packages, :country
  	add_index :packages, :day
  	add_index :public_reservations, :package_id
  	add_index :private_reservations, :package_id
  	add_index :private_reservations, :user_id
  end
end
