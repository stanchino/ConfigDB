class EnvironmentsController < ApplicationController
  load_and_authorize_resource :organization
  load_and_authorize_resource through: :organization

  include Response

  # GET /organizations/{organization_id}/environments
  # GET /organizations/{organization_id}/environments.json
  api :GET, '/organizations/:organization_id/environments'
  param :organization_id, :number
  def index
  end

  # GET /organizations/{organization_id}/environments/{id}
  # GET /organizations/{organization_id}/environments/{id}.json
  api :GET, '/organizations/:organization_id/environments/:id'
  param :organization_id, :number
  param :id, :number
  def show
  end

  # GET /organizations/{organization_id}/environments/new
  api :GET, '/organizations/:organization_id/environments/new'
  param :organization_id, :number
  def new
  end

  # GET /organizations/{organization_id}/environments/{id}/edit
  api :GET, '/organizations/:organization_id/environments/:id/edit'
  param :organization_id, :number
  param :id, :number
  def edit
  end

  # POST /organizations/{organization_id}/environments
  # POST /organizations/{organization_id}/environments.json
  api :POST, '/organizations/:organization_id/environments'
  param :organization_id, :number
  def create
    create_object(@environment, [@organization, @environment], 'Environment was successfully created.')
  end

  # PATCH/PUT /organizations/{organization_id}/environments/{id}
  # PATCH/PUT /organizations/{organization_id}/environments/{id}.json
  api :PUT, '/organizations/:organization_id/environments/:id'
  param :organization_id, :number
  param :id, :number
  def update
    update_object(@environment, environment_params, organization_environment_url(@organization, @environment), 'Environment was successfully updated.')
  end

  # DELETE /organizations/{organization_id}/environments/{id}
  # DELETE /organizations/{organization_id}/environments/{id}.json
  api :DELETE, '/organizations/:organization_id/environments/:id'
  param :organization_id, :number
  param :id, :number
  def destroy
    destroy_object(@environment, organization_environments_url(@organization), 'Environment was successfully destroyed.')
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def environment_params
      params.require(:environment).permit(:organization_id, :name, :textkey)
    end
end
