json.array!(@scopes) do |scope|
  json.extract! scope, :id, :organization_id
  json.url scope_url(scope, format: :json)
end
