json.array!(@idea_keywords) do |idea_keyword|
  json.extract! idea_keyword, :id, :idea_id, :keyword_id
  json.url idea_keyword_url(idea_keyword, format: :json)
end
