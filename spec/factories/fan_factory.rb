FactoryGirl.define do
  factory :fan do
    first_name 'robin'
    last_name 'futureworkz'
    sequence(:email) { |n| "robinhood#{n}@example.com" }
    password '12345678'
  end
end
