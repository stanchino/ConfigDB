require 'spec_helper'

describe Scope do
  describe 'relations' do
    it { should belong_to(:organization) }
    it { should have_many(:variables).through(:values) }
  end
end
