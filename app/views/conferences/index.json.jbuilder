json.array!(@conferences) do |conference|
  json.extract! conference, :id, :title, :url, :from_date, :to_date, :venue_city, :venue_country, :cfp_opens_on, :cfp_closes_on, :created_by, :created_by_email, :topic_id
  json.url conference_url(conference, format: :json)
end
