json.array!(@titles) do |title|
  json.extract! title, :id, :value
  json.url title_url(title, format: :json)
end
