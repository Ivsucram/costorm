json.array!(@idea_points) do |idea_point|
  json.extract! idea_point, :id, :idea_id, :user_id, :vote
  json.url idea_point_url(idea_point, format: :json)
end
