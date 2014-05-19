require 'spec_helper'

describe Organization do
  describe 'relations' do
    it { should have_many(:users) }
    it { should have_many(:environments) }
  end
end
