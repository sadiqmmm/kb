json.array!(@contents) do |content|
  json.extract! content, :id, :description, :title_id
  json.url content_url(content, format: :json)
end
