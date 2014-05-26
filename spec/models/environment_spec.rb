require 'spec_helper'

describe Environment do
  describe 'relations' do
    it { should belong_to(:organization) }
    it { should have_many(:variables).through(:values) }
  end

  describe 'validations' do
    it { should validate_presence_of(:organization).on(:create) }
    it { should validate_uniqueness_of(:textkey).scoped_to(:organization_id) }
  end
end
