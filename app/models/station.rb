# == Schema Information
#
# Table name: stations
#
#  id              :integer          not null, primary key
#  station_name    :string           not null
#  available_docks :integer          default(0)
#  available_bikes :integer          default(0)
#  total_docks     :integer          default(0)
#  latitude        :float            not null
#  longitude       :float            not null
#  status_value    :string
#  status_key      :string           default("-1")
#  st_address_one  :string
#  st_address_two  :string
#  city            :string
#  postal_code     :string
#  location        :string
#  altitude        :string
#  test_station    :boolean          default(FALSE)
#  last_update     :datetime
#  landmark        :string
#

class Station < ApplicationRecord
  extend HelperPlugin

  def to_json
    as_json.merge({ maps_url: google_maps_url })
  end

  def self.converted_hash
    {
        id: 'id',
        stationName: 'station_name',
        availableDocks: 'available_docks',
        totalDocks: 'total_docks',
        latitude: 'latitude',
        longitude: 'longitude',
        statusValue: 'status_value',
        statusKey: 'status_key',
        stAddress1: 'st_address_one',
        stAddress2: 'st_address_two',
        availableBikes: 'available_bikes',
        city: 'city',
        postalCode: 'postal_code',
        location: 'location',
        altitude: 'altitude',
        testStation: 'test_station',
        lastCommunicationTime: 'last_update',
        landmark: 'landmark'
    }
  end

  private

  def google_maps_url
    "https://maps.googleapis.com/maps/api/staticmap?center=#{latitude},#{longitude}&markers=#{latitude},#{longitude}&zoom=20&size=400x250&maptype=roadmap&key=#{Rails.application.secrets.google_maps_key}"
  end
end
