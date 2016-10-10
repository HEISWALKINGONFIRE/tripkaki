class AddColumnAndRemoveColumn < ActiveRecord::Migration
  def change
  	add_column :public_reservations, :public_price, :integer, null: true
  	remove_column :packages, :public_price, index: true
  end
end
