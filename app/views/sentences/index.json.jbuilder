json.array!(@sentences) do |sentence|
  json.extract! sentence, :id, :value
  json.url sentence_url(sentence, format: :json)
end
