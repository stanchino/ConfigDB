require 'spec_helper'

describe Variable do
  describe 'relations' do
    it { should have_many(:scopes).through(:values) }
    it { should have_many(:environments).through(:values) }
  end
end
