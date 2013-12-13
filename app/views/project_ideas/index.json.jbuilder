json.array!(@project_ideas) do |project_idea|
  json.extract! project_idea, :id, :idea_id, :project_id
  json.url project_idea_url(project_idea, format: :json)
end
