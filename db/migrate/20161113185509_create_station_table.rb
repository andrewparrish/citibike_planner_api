class CreateStationTable < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.string :station_name, null: false
      t.integer :available_docks, default: 0
      t.integer :available_bikes, default: 0
      t.integer :total_docks, default: 0
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :status_value, default: nil
      t.string :status_key, default: -1
      t.string :st_address_one
      t.string :st_address_two
      t.string :city
      t.string :postal_code
      t.string :location
      t.string :altitude
      t.boolean :test_station, default: false
      t.datetime :last_update
      t.string :landmark
    end
  end
end
