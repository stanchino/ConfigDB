require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ApplicationHelper do
  describe '#root_url' do
    context 'authenticated' do
      before { expect(helper).to receive(:current_user) { true } }
      it { expect(helper.root_url).to eq authenticated_root_url }
    end

    context 'unauthenticated' do
      before { expect(helper).to receive(:current_user) { false } }
      it { expect(helper.root_url).to eq unauthenticated_root_url }
    end
  end
end

