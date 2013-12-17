json.array!(@followers) do |follower|
  json.extract! follower, :id, :following_id, :follower_id
  json.url follower_url(follower, format: :json)
end
