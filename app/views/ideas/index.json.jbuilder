json.array!(@ideas) do |idea|
  json.extract! idea, :id, :project_id, :author_id, :publishedDate, :description
  json.url idea_url(idea, format: :json)
end
