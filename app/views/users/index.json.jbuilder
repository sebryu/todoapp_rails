json.array!(@users) do |user|
  json.extract! user, :id, :nick, :profile_color, :role
  json.url user_url(user, format: :json)
end
