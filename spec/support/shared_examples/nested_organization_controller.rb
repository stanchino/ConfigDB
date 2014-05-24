shared_examples "nested organization controller" do |klass|
  let(:user) { FactoryGirl.build(:super_admin) }

  let(:organization) { user.organization }

  before do
    @resource_collection = klass.to_s.tableize.to_sym
    @resource_object = klass.to_s.tableize.singularize.to_sym
  end

  before do
    allow(subject).to receive(:current_user) { user }
  end

  def create_resource(klass)
    @resource_model = klass.create! valid_attributes
  end

  describe "GET index" do
    before { create_resource(klass) }
    it "assigns all #{@resource_collection} as @#{@resource_collection}" do
      get :index, {organization_id: organization.to_param}, valid_session
      assigns(@resource_collection).should eq([@resource_model])
    end
  end

  describe "GET show" do
    before { create_resource(klass) }
    it "assigns the requested #{@resource_object} as @#{@resource_object}" do
      get :show, {:id => @resource_model.to_param, organization_id: organization.to_param}, valid_session
      assigns(@resource_object).should eq(@resource_model)
    end
  end

  describe "GET new" do
    it "assigns a new #{@resource_object} as @#{@resource_object}" do
      get :new, {organization_id: organization.to_param}, valid_session
      assigns(@resource_object).should be_a_new(klass)
    end
  end

  describe "GET edit" do
    before { create_resource(klass) }
    it "assigns the requested #{@resource_object} as @#{@resource_object}" do
      get :edit, {:id => @resource_model.to_param, organization_id: organization.to_param}, valid_session
      assigns(@resource_object).should eq(@resource_model)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new #{klass}" do
        expect {
          post :create, {organization_id: organization.to_param, @resource_object => valid_attributes}, valid_session
        }.to change(klass, :count).by(1)
      end

      it "assigns a newly created #{@resource_object} as @#{@resource_object}" do
        post :create, {organization_id: organization.to_param, @resource_object => valid_attributes}, valid_session
        assigns(@resource_object).should be_a(klass)
        assigns(@resource_object).should be_persisted
      end

      it "redirects to the created #{@resource_object}" do
        post :create, {organization_id: organization.to_param, @resource_object => valid_attributes}, valid_session
        response.should redirect_to([organization, klass.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved #{@resource_object} as @#{@resource_object}" do
        # Trigger the behavior that occurs when invalid params are submitted
        klass.any_instance.stub(:save).and_return(false)
        post :create, {organization_id: organization.to_param, @resource_object => { "organization" => "invalid value" }}, valid_session
        assigns(@resource_object).should be_a_new(klass)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        klass.any_instance.stub(:save).and_return(false)
        post :create, {organization_id: organization.to_param, @resource_object => { "organization" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before { create_resource(klass) }
    describe "with valid params" do
      it "updates the requested #{@resource_object}" do
        klass.any_instance.should_receive(:update).with(valid_attributes)
        put :update, {:id => @resource_model.to_param, organization_id: organization.to_param, @resource_object => valid_attributes}, valid_session
      end

      it "assigns the requested #{@resource_object} as @#{@resource_object}" do
        put :update, {:id => @resource_model.to_param, organization_id: organization.to_param, @resource_object => valid_attributes}, valid_session
        assigns(@resource_object).should eq(@resource_model)
      end

      it "redirects to the #{@resource_object}" do
        put :update, {:id => @resource_model.to_param, organization_id: organization.to_param, @resource_object => valid_attributes}, valid_session
        response.should redirect_to([organization, @resource_model])
      end
    end

    describe "with invalid params" do
      it "assigns the #{@resource_object} as @#{@resource_object}" do
        # Trigger the behavior that occurs when invalid params are submitted
        klass.any_instance.stub(:save).and_return(false)
        put :update, {:id => @resource_model.to_param, organization_id: organization.to_param, @resource_object => { "organization" => "invalid value" }}, valid_session
        assigns(@resource_object).should eq(@resource_model)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        klass.any_instance.stub(:save).and_return(false)
        put :update, {:id => @resource_model.to_param, organization_id: organization.to_param, @resource_object => { "organization" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before { create_resource(klass) }
    it "destroys the requested #{@resource_object}" do
      expect {
        delete :destroy, {:id => @resource_model.to_param, organization_id: organization.to_param}, valid_session
      }.to change(klass, :count).by(-1)
    end

    it "redirects to the #{@resource_collection} list" do
      delete :destroy, {:id => @resource_model.to_param, organization_id: organization.to_param}, valid_session
      collection_url = send("organization_#{@resource_collection}_url", organization)
      response.should redirect_to collection_url
    end
  end

end
