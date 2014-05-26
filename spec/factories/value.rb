# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :value do
    variable
    environment
    scope
    value Faker::Lorem.word
  end
end
