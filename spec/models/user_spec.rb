require 'spec_helper'

describe User do
  describe 'relations' do
    it { should belong_to(:organization) }
  end

  describe 'validations' do
    it { should validate_presence_of(:organization).on(:create) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

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

  describe '#role_set?' do
    context 'with roles' do
      subject { stub_model(User, roles: []) }
      it { expect(subject.send(:role_set?)).to be_false }
    end
    context 'without roles' do
      subject { stub_model(User, roles: [stub_model(Role)]) }
      it { expect(subject.send(:role_set?)).to be_true }
    end
  end

  describe '#set_default_role' do
    before do
      expect(subject).to receive(:add_role).with(:user)
    end

    it { subject.send(:set_default_role) }
  end
end
