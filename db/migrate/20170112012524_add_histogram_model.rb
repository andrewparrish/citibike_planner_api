class AddHistogramModel < ActiveRecord::Migration[5.0]
  def change
    create_table :histograms do |t|
      t.integer :week_day, null: false, index: true
      t.integer :month, null: false, index: true
      t.integer :day_of_month, null: false
      t.integer :year, null: false, index: true
      t.integer :hour, null: false, index: true
      t.integer :minute, null: false, index: true
      t.datetime :time, null: false, index: true
      t.integer :available_bikes
      t.integer :available_docks
      t.integer :station_id, index: true
    end
  end
end
