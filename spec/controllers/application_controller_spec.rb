require 'spec_helper'

describe ApplicationController do
  describe '#layout_by_resource' do
    context 'devise controller' do
      before { expect(subject).to receive(:devise_controller?) { true } }
      it { expect(subject.layout_by_resource).to eq 'landing' }
    end

    context 'regular controller' do
      before { expect(subject).to receive(:devise_controller?) { false } }
      it { expect(subject.layout_by_resource).to eq 'application' }
    end
  end

  describe '#should_check_authorization?' do
    before do
    end
    context 'devise controller' do
      before { expect(subject).to receive(:respond_to?).with(:devise_controller? || :dashboard_controller?) { false } }
      it { expect(subject.should_check_authorization?).to be_false }
    end
    context 'dashboard_controller' do
      before { expect(subject).to receive(:respond_to?).with(:devise_controller? || :dashboard_controller?) { true } }
      it { expect(subject.should_check_authorization?).to be_true }
    end
  end

  describe '#configure_devise_permitted_parameters' do
    let(:attrs) { double(Object) }

    before do
      subject.stub_chain(:devise_parameter_sanitizer, :for).with().with(:sign_up).and_yield attrs
      expect(attrs).to receive(:permit).with(:full_name, :email, :password, :password_confirmation, { organization_attributes: [:name] }) { 'result' }
    end
    it { expect(subject.configure_devise_permitted_parameters).to eq 'result' }
  end
end
