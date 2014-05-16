require 'spec_helper'

describe User do
  describe '#full_name' do
    context 'without name' do
      subject { stub_model(User, first_name: nil, last_name: nil) }
      it { expect(subject.full_name).to eq '' }
    end
    context 'without first_name' do
      subject { stub_model(User, first_name: nil, last_name: 'Doe') }
      it { expect(subject.full_name).to eq 'Doe' }
    end
    context 'without last_name' do
      subject { stub_model(User, first_name: 'John', last_name: nil) }
      it { expect(subject.full_name).to eq 'John' }
    end
    context 'with name' do
      subject { stub_model(User, first_name: 'John', last_name: 'Doe') }
      it { expect(subject.full_name).to eq 'John Doe' }
    end
  end
end
