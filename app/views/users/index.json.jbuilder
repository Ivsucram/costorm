json.array!(@users) do |user|
  json.extract! user, :id, :name, :nick, :email, :password, :company, :term_flag, :confirmed_account, :term_date, :birthday
  json.url user_url(user, format: :json)
end
