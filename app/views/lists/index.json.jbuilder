json.array!(@lists) do |list|
  json.extract! list, :id, :name, :color
  json.url list_url(list, format: :json)
end
