class CategoriesController < ApplicationController
  load_and_authorize_resource :organization
  load_and_authorize_resource through: :organization

  include Response

  # GET /categories
  # GET /categories.json
  api :GET, '/organizations/:organization_id/categories'
  param :organization_id, :number
  def index
  end

  # GET /categories/1
  # GET /categories/1.json
  api :GET, '/organizations/:organization_id/categories/:id'
  param :organization_id, :number
  param :id, :number
  def show
  end

  # GET /categories/new
  api :GET, '/organizations/:organization_id/categories/new'
  param :organization_id, :number
  def new
  end

  # GET /categories/1/edit
  api :GET, '/organizations/:organization_id/categories/:id/edit'
  param :organization_id, :number
  param :id, :number
  def edit
  end

  # POST /categories
  # POST /categories.json
  api :POST, '/organizations/:organization_id/categories'
  param :organization_id, :number
  def create
    create_object(@category, [@organization, @category], 'Category was successfully created.')
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  api :PUT, '/organizations/:organization_id/categories/:id'
  param :organization_id, :number
  param :id, :number
  def update
    update_object(@category, category_params, [@organization, @category], 'Category was successfully updated.')
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  api :DELETE, '/organizations/:organization_id/categories/:id'
  param :organization_id, :number
  param :id, :number
  def destroy
    destroy_object(@category, organization_categories_url(@organization), 'Category was successfully destroyed.')
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:organization_id, :name, :textkey)
    end
end
