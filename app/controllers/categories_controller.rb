class CategoriesController < ApplicationController
  load_and_authorize_resource :organization
  load_and_authorize_resource through: :organization

  include Response

  # GET /categories
  # GET /categories.json
  def index
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    create_object(@category, [@organization, @category], 'Category was successfully created.')
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    update_object(@category, category_params, [@organization, @category], 'Category was successfully updated.')
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    destroy_object(@category, organization_categories_url(@organization), 'Category was successfully destroyed.')
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:organization_id)
    end
end
