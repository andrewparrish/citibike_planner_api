FactoryGirl.define do
  factory :station do |s|
    s.id 3440
    s.station_name "Fulton St & Adams St"
    s.available_docks 39
    s.available_bikes 4
    s.total_docks 43
    s.latitude 40.6924182925785
    s.longitude -73.989494740963
    s.status_value "In Service"
    s.status_key "1"
    s.st_address_one "Fulton St & Adams St"
    s.st_address_two ""
  end
end