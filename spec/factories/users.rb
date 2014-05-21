# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email "john@doe.com"
    password "MyString"
    organization

    factory :super_admin do
      after(:build) { |user| user.add_role(:super_admin) }
    end

    factory :regular_user do
      after(:build) { |user| user.add_role(:user) }
    end
  end
end
