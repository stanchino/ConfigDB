require 'faker'

FactoryGirl.define do
  factory :role do
    name Faker::Name.name
  end

  factory :super_admin_role do
    name 'super_admin'
  end

  factory :admin_role do
    name 'admin'
  end

  factory :user_role do
    name 'user'
  end
end
