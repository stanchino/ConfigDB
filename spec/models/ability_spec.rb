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
    let(:organization) { stub_model(Organization) }

    it { should be_able_to(:show, user.organization) }
    it { should be_able_to(:update, user.organization) }
    it { should_not be_able_to(:show, organization) }
    it { should_not be_able_to(:update, organization) }
  end
end
