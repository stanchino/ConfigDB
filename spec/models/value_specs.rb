require 'spec_helper'

describe Value do
  describe 'relations' do
    it { should belong_to(:variable) }
    it { should belong_to(:environment) }
    it { should belong_to(:scope) }
  end
end
