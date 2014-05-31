require 'spec_helper'

describe Organization do
  describe 'relations' do
    it { should belong_to(:account) }
    it { should have_many(:users).through(:account) }
    it { should have_many(:environments) }
    it { should have_many(:scopes) }
    it { should have_many(:categories) }
  end
end
