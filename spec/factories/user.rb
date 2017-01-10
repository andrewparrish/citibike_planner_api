FactoryGirl.define do
  factory :user do |u|
    u.email 'test@test.com'
    u.password 'test01234'
  end
end