# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :scope do
    name Faker::Lorem.word
    textkey Faker::Lorem.word
    organization
  end
end
