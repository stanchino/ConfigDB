include Warden::Test::Helpers
Warden.test_mode!

def login_new_user(role_name)
  role = FactoryGirl.create(:role, name: role_name.to_sym)
  let(:organization) { FactoryGirl.create(:organization) }
  let(:user) { stub_model(User, FactoryGirl.attributes_for(:user, roles: [role], organization_id: organization.to_param)) }

  before do
    login_as(user, scope: :user)
  end
end
