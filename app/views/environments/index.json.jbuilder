json.array!(@environments) do |environment|
  json.extract! environment, :id, :organization_id, :name, :textkey
  json.url environment_url(environment, format: :json)
end
