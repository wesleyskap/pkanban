FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password "my-password"
    password_confirmation "my-password"
  end
end
