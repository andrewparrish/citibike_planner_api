require 'test_helper'

class StationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get station_index_url
    assert_response :success
  end

  test "should get show" do
    get station_show_url
    assert_response :success
  end

end
