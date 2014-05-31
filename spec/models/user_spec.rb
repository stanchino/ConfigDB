require 'spec_helper'

describe User do
  describe 'relations' do
    it { should belong_to(:account) }
    it { should have_many(:organizations).through(:account) }
  end

  describe 'validations' do
    it { should validate_presence_of(:full_name) }
  end

  describe '#first_name' do
    context 'without full name' do
      subject { stub_model(User, full_name: nil) }
      it { expect(subject.first_name).to eq '' }
    end
    context 'wit full name' do
      subject { stub_model(User, full_name: 'John') }
      it { expect(subject.first_name).to eq 'John' }
    end
  end

  describe '#last_name' do
    context 'without full name' do
      subject { stub_model(User, full_name: nil) }
      it { expect(subject.last_name).to eq '' }
    end
    context 'without last name' do
      subject { stub_model(User, full_name: 'John') }
      it { expect(subject.last_name).to eq '' }
    end
    context 'with last name' do
      subject { stub_model(User, full_name: 'John Doe') }
      it { expect(subject.last_name).to eq 'Doe' }
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
