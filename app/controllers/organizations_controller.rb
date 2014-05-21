class OrganizationsController < ApplicationController
  load_and_authorize_resource

  include Response
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)
    create_object(@organization, @organization, 'Organization was successfully created.')
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    update_object(@organization, organization_params, organization_url(@organization), 'Organization was successfully updated')
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    destroy_object(@organization, organizations_url, 'Organization was successfully destroyed.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name)
    end
end
