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

  describe '#no_autocomplete_simple_form_for' do
    let(:options_with_html) { { html: { foo: 'bar' } } }
    let(:expected_options_with_html) { { html: { foo: 'bar', autocomplete: 'off' } } }
    let(:options_without_html) { { foo: 'bar' } }
    let(:expected_options_without_html) { { foo: 'bar', html: { autocomplete: 'off' } } }
    let(:expected_empty_options) { { html: { autocomplete: 'off' } } }
    let(:resource) { double(Object) }

    context 'with html options' do
      before { expect(helper).to receive(:simple_form_for).with(resource, expected_options_with_html) { 'result' } }
      it { expect(helper.no_autocomplete_simple_form_for(resource, options_with_html)).to eq 'result' }
    end

    context 'without html options' do
      before { expect(helper).to receive(:simple_form_for).with(resource, expected_options_without_html) { 'result' } }
      it { expect(helper.no_autocomplete_simple_form_for(resource, options_without_html)).to eq 'result' }
    end

    context 'without options' do
      before { expect(helper).to receive(:simple_form_for).with(resource, expected_empty_options) { 'result' } }
      it { expect(helper.no_autocomplete_simple_form_for(resource)).to eq 'result' }
    end
  end

  describe '#prepend_input' do
    before { expect(helper).to receive(:render).with(partial: 'shared/prepend_input', locals: {builder: 'a', resource: 'b', icon: 'c', options: 'd'}) { 'result' } }
    it { expect(helper.prepend_input('a', 'b', 'c', 'd')).to eq 'result' }
  end
end
