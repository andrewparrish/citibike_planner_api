require 'rails_helper'

RSpec.describe User, :type => :model do
  user = FactoryGirl.create(:user)

  it 'set up basic fields' do
    expect(user.email).to eql "test@test.com"
  end

  it 'can favorite a station' do
    station = FactoryGirl.create(:station)
    user.favorite!(station)
    expect(user.stations.count).to eql 1
  end
end
