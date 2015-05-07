json.array!(@meetups) do |meetup|
  json.extract! meetup, :id, :title, :user_id, :disc, :lat, :long
  json.url meetup_url(meetup, format: :json)
end
