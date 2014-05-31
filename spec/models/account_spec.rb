require 'spec_helper'

describe Account do
  describe 'relations' do
    it { should have_many(:users) }
    it { should have_many(:organizations) }
  end
end
