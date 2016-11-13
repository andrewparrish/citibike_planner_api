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

require 'test_helper'

class StationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
