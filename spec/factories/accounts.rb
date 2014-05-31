# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    after(:build) { |account| account.organizations << FactoryGirl.build(:organization, account: account) }

    factory :super_admin_account do
      after(:build) { |account| account.users << FactoryGirl.build(:super_admin, account: account) }
    end

    factory :regular_account do
      after(:build) { |account| account.users << FactoryGirl.build(:regular_user, account: account) }
    end
  end
end
