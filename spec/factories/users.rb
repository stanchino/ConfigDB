# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :user do
    full_name Faker::Name.name
    sequence(:email) { |n| Faker::Internet.email("person#{n}") }
    password Faker::Lorem.characters(10)
    organization

    factory :super_admin do
      after(:build) { |user| user.add_role(:super_admin) }
    end

    factory :regular_user do
      after(:build) { |user| user.add_role(:user) }
    end
  end
end
