class ScopesController < ApplicationController
  load_and_authorize_resource

  include Response

  before_action :get_organization
  before_action :set_scopes
  before_action :set_scope, only: [:show, :edit, :update, :destroy]

  # GET /scopes
  # GET /scopes.json
  def index
  end

  # GET /scopes/1
  # GET /scopes/1.json
  def show
  end

  # GET /scopes/new
  def new
    @scope = @scopes.new
  end

  # GET /scopes/1/edit
  def edit
  end

  # POST /scopes
  # POST /scopes.json
  def create
    @scope = @scopes.new(scope_params)
    create_object(@scope, [@organization, @scope], 'Scope was successfully created.')
  end

  # PATCH/PUT /scopes/1
  # PATCH/PUT /scopes/1.json
  def update
    update_object(@scope, scope_params, organization_scope_url(@organization, @scope), 'Scope was successfully updated.')
  end

  # DELETE /scopes/1
  # DELETE /scopes/1.json
  def destroy
    destroy_object(@scope, organization_scopes_url(@organization), 'Scope was successfully destroyed.')
  end

  private
    def get_organization
      @organization = Organization.find(params[:organization_id])
    end

    def set_scopes
      @scopes = @organization.scopes
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_scope
      @scope = @scopes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scope_params
      params.require(:scope).permit(:organization_id)
    end
end
