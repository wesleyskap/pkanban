# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "email@example.com"
    password "my-password"
    password_confirmation "my-password"
  end
end
