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
    let(:user) { FactoryGirl.build(:regular_user) }
    let(:organization) { user.organization }
    let(:environment) { FactoryGirl.build(:environment, organization: organization) }
    let(:another_organization) { stub_model(Organization) }
    let(:another_environment) { FactoryGirl.build(:environment, organization: another_organization) }

    it { should be_able_to(:show, organization) }
    it { should be_able_to(:update, organization) }
    it { should be_able_to(:manage, environment) }
    it { should_not be_able_to(:show, another_organization) }
    it { should_not be_able_to(:update, another_organization) }
    it { should_not be_able_to(:manage, another_environment) }
  end
end
