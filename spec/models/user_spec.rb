require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'can favorite stations' do
    user = FactoryGirl.create(:user)
    expect(user.email).to eql "test@test.com"
  end
end
