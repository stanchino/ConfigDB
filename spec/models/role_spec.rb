require 'spec_helper'

describe Role do
  describe 'relations' do
    it { should belong_to(:resource) }
    it { should have_and_belong_to_many(:users) }
  end
end
