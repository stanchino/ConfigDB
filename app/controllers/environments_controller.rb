class EnvironmentsController < ApplicationController
  load_and_authorize_resource

  include Response

  before_action :get_organization
  before_action :set_environments
  before_action :set_environment, only: [:show, :edit, :update, :destroy]

  # GET /organizations/{organization_id}/environments
  # GET /organizations/{organization_id}/environments.json
  def index
    @environments = @environments.all
  end

  # GET /organizations/{organization_id}/environments/{id}
  # GET /organizations/{organization_id}/environments/{id}.json
  def show
  end

  # GET /organizations/{organization_id}/environments/new
  def new
    @environment = @environments.new
  end

  # GET /organizations/{organization_id}/environments/{id}/edit
  def edit
  end

  # POST /organizations/{organization_id}/environments
  # POST /organizations/{organization_id}/environments.json
  def create
    @environment = @environments.new(environment_params)

    respond_to do |format|
      if @environment.save
        render_success format, [@organization, @environment], 'Environment was successfully created.'
      else
        render_error format, @environment, :new
      end
    end
  end

  # PATCH/PUT /organizations/{organization_id}/environments/{id}
  # PATCH/PUT /organizations/{organization_id}/environments/{id}.json
  def update
    respond_to do |format|
      if @environment.update(environment_params)
        render_success format, [@organization, @environment], 'Environment was successfully updated.'
      else
        render_error format, @environment, :edit
      end
    end
  end

  # DELETE /organizations/{organization_id}/environments/{id}
  # DELETE /organizations/{organization_id}/environments/{id}.json
  def destroy
    @environment.destroy
    respond_to do |format|
      render_no_content format, organization_environments_url(@organization), 'Environment was successfully destroyed.'
    end
  end

  private
    def get_organization
      @organization = Organization.find(params[:organization_id])
    end

    def set_environments
      @environments = @organization.environments
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_environment
      @environment = @environments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def environment_params
      params.require(:environment).permit(:organization_id, :name, :textkey)
    end
end