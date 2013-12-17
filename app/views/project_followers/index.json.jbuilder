json.array!(@project_followers) do |project_follower|
  json.extract! project_follower, :id, :user_id, :project_id
  json.url project_follower_url(project_follower, format: :json)
end
