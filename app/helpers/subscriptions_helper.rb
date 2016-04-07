module SubscriptionsHelper
  def get_live_conferences(subscription)
    topic = Topic.find_by(id: subscription.topic_id)
    conferences = topic.conferences.select { |conf| conf.from_date > Date.today }
  end
  def get_cfp_open_conferences(subscription)
    topic = Topic.find_by(id: subscription.topic_id)
    conferences = topic.conferences.select { |conf| conf.cfp_closes_on > Date.today }
  end
end
