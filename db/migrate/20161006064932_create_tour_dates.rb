class CreateTourDates < ActiveRecord::Migration
  def change
  	create_table :tour_dates do |t|
  		t.date :start_date
  		t.date :end_date

  		t.references :package, index: true, foreign_key: true
      t.timestamps null: false
  	end
	end
end
