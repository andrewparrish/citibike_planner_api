require 'rails_helper'

RSpec.describe GenerateHistogramService do

  it 'can generate histogram from station' do
    station = FactoryGirl.create(:station, available_bikes: 10, available_docks: 10)
    time = "2017-01-15 13:30:23 -0500"
    GenerateHistogramService.perform(station.id, station.available_bikes, station.available_docks , time)

    expect(station.reload.histograms.count).to eql 1
  end
end