class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|

    	t.string :title
  		t.string :destination
  		t.string :state
  		t.string :country
  		t.integer :day
  		t.text :description
  		t.string :accommodation
  		t.string :transportation
  		t.string :meal
  		t.integer :head
  		t.integer :public_price
  		t.integer :private_price


  		t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
