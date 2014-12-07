json.array!(@titles) do |title|
  json.extract! title, :id, :name, :topic_id
  json.url title_url(title, format: :json)
end
