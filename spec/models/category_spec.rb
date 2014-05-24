require 'spec_helper'

describe Category do
  describe 'relations' do
    it { should belong_to(:organization) }
  end
end
