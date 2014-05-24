require 'spec_helper'

describe Scope do
  describe 'relations' do
    it { should belong_to(:organization) }
  end
end
