class CategoriesController < ApplicationController
  load_and_authorize_resource

  include Response

  before_action :get_organization
  before_action :set_categories
  before_action :set_category, only: [:show, :edit, :update, :destroy]

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
    @category = @categories.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = @categories.new(category_params)
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
    def get_organization
      @organization = Organization.find(params[:organization_id])
    end

    def set_categories
      @categories = @organization.categories
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:organization_id)
    end
end
