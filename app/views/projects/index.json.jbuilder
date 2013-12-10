json.array!(@projects) do |project|
  json.extract! project, :id, :author_id, :name, :description, :projectType, :isPublishedFlag, :publishedDate, :createdDate, :lastUpdateDate
  json.url project_url(project, format: :json)
end
