class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|

    	t.string :title, null: false
  		t.string :destination
  		t.string :state, null: false
  		t.string :country, null: false
  		t.integer :day, null:false
  		t.text :description, null:false
  		t.boolean :accommodation, default: true
  		t.string :transportation
  		t.string :meal
  		t.integer :head
  		t.integer :public_price
  		t.integer :private_price
      t.json :images


  		t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
