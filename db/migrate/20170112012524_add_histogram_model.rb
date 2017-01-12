class AddHistogramModel < ActiveRecord::Migration[5.0]
  def change
    create_table :histograms do |t|
      t.integer :week_day, null: false, index: true
      t.integer :month, null: false, index: true
      t.integer :day_of_month, null: false, index: true
      t.integer :year, null: false, index: true
      t.integer :hour, null: false, index: true
      t.integer :minute, null: false, index: true
      t.datetime :start_date, null: false
      t.datetime :end_time, null: false
      t.integer :available_bikes
      t.integer :available_docks
    end
  end
end
