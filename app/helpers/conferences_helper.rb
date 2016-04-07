module ConferencesHelper
  def get_subscribers(conference)
    subscribers = []
    conference.topics.each do |topic|
      Subscription.where(" topic_id = ? ", [topic.id]).map(&:email).each do |email|
        subscribers << email
      end
    end
    subscribers = subscribers.uniq
  end
end
