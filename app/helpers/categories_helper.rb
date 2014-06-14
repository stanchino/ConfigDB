module CategoriesHelper
  def current_category
    @category || @organization.categories.build
  end
end
