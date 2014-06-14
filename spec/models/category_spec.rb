require 'spec_helper'

describe Category do
  describe 'relations' do
    it { should belong_to(:organization) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:textkey) }
    it { should validate_uniqueness_of(:name).scoped_to(:organization_id) }
    it { should validate_uniqueness_of(:textkey).scoped_to(:organization_id) }
  end
end
