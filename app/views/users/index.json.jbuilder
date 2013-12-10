json.array!(@users) do |user|
  json.extract! user, :id, :name, :nick, :email, :password, :company, :termflag, :confirmedAccount, :termDate, :birthday
  json.url user_url(user, format: :json)
end
