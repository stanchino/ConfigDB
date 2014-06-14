module ScopesHelper
  def current_scope
    @scope || @organization.scopes.build
  end
end
