class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :user_id
      t.string :title
      t.string :description 
      t.string :state
      t.string :country 
      t.integer :num_of_days
      t.decimal :private_price
      t.decimal :public_price
      t.json :images
      t.boolean :transport
      t.boolean :accomodation
      t.boolean :food
      t.integer :max_participants
      
      t.timestamps null: false
    end
  end
end
