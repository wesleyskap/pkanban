FactoryGirl.define do
  factory :sprint do
    sequence(:name) { |n| "Test #{n}" }
    date_init '10-05-2013'
    date_end '10-06-2013'
    association :user
  end
end
