class ScopesController < ApplicationController
  load_and_authorize_resource :organization
  load_and_authorize_resource through: :organization

  include Response

  # GET /organizations/{ortanization_id}/scopes
  # GET /organizations/{ortanization_id}/scopes.json
  api :GET, '/organizations/:organization_id/environments'
  param :organization_id, :number
  def index
  end

  # GET /organizations/{ortanization_id}/scopes/{id}
  # GET /organizations/{ortanization_id}/scopes/{id}.json
  api :GET, '/organizations/:organization_id/environments/:id'
  param :organization_id, :number
  param :id, :number
  def show
  end

  # GET /organizations/{ortanization_id}/scopes/new
  api :GET, '/organizations/:organization_id/environments/new'
  param :organization_id, :number
  def new
  end

  # GET /organizations/{ortanization_id}/scopes/{id}/edit
  api :GET, '/organizations/:organization_id/environments/:id/edit'
  param :organization_id, :number
  param :id, :number
  def edit
  end

  # POST /organizations/{ortanization_id}/scopes
  # POST /organizations/{ortanization_id}/scopes.json
  api :POST, '/organizations/:organization_id/environments'
  param :organization_id, :number
  def create
    create_object(@scope, [@organization, @scope], 'Scope was successfully created.')
  end

  # PATCH/PUT /organizations/{ortanization_id}/scopes/{id}
  # PATCH/PUT /organizations/{ortanization_id}/scopes/{id}.json
  api :PUT, '/organizations/:organization_id/environments/:id'
  param :organization_id, :number
  param :id, :number
  def update
    update_object(@scope, scope_params, organization_scope_url(@organization, @scope), 'Scope was successfully updated.')
  end

  # DELETE /organizations/{ortanization_id}/scopes/1
  # DELETE /organizations/{ortanization_id}/scopes/{id}.json
  api :DELETE, '/organizations/:organization_id/environments/:id'
  param :organization_id, :number
  param :id, :number
  def destroy
    destroy_object(@scope, organization_scopes_url(@organization), 'Scope was successfully destroyed.')
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def scope_params
      params.require(:scope).permit(:organization_id, :name, :textkey)
    end
end
