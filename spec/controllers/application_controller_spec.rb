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
end
