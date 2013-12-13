json.array!(@friends) do |friend|
  json.extract! friend, :id, :user_id_1, :user_id_2
  json.url friend_url(friend, format: :json)
end
