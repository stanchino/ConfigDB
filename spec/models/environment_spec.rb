require 'spec_helper'

describe Environment do
  describe 'relations' do
    it { should belong_to(:organization) }
  end

  describe 'validations' do
    it { should validate_presence_of(:organization).on(:create) }
    it { should validate_uniqueness_of(:textkey).scoped_to(:organization_id) }
  end
end
