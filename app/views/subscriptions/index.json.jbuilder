json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :email, :topic_id
  json.url subscription_url(subscription, format: :json)
end
