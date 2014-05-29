require 'spec_helper'
require "cancan/matchers"

describe Ability do
  subject { Ability.new(user) }

  let(:user) { nil }

  context "super_admin" do
    let(:user) { FactoryGirl.build(:super_admin) }
    it { should be_able_to(:manage, :all) }
  end

  context "user" do
    let(:user) { FactoryGirl.create(:regular_user) }
    let(:another_user) { FactoryGirl.create(:regular_user) }
    let(:organization) { user.organization }
    let(:environment) { FactoryGirl.build(:environment, organization: organization) }
    let(:scope) { FactoryGirl.build(:scope, organization: organization) }
    let(:category) { FactoryGirl.build(:category, organization: organization) }
    let(:another_organization) { stub_model(Organization) }
    let(:another_environment) { FactoryGirl.build(:environment, organization: another_organization) }
    let(:another_scope) { FactoryGirl.build(:scope, organization: another_organization) }
    let(:another_category) { FactoryGirl.build(:category, organization: another_organization) }

    it { should be_able_to(:update, user) }
    it { should be_able_to(:show, organization) }
    it { should be_able_to(:update, organization) }
    it { should be_able_to(:manage, environment) }
    it { should be_able_to(:manage, scope) }
    it { should be_able_to(:manage, category) }
    it { should_not be_able_to(:update, another_user) }
    it { should_not be_able_to(:show, another_organization) }
    it { should_not be_able_to(:update, another_organization) }
    it { should_not be_able_to(:manage, another_environment) }
    it { should_not be_able_to(:manage, another_scope) }
    it { should_not be_able_to(:manage, another_category) }
  end
end
