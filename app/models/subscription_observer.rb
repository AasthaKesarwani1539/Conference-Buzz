class SubscriptionObserver < ActiveRecord::Observer
  include SubscriptionsHelper
  def after_create(subscription)
    live_conferences = get_live_conferences(subscription)
    cfp_open_conferences = get_cfp_open_conferences(subscription)
    if live_conferences.count > 0
      NotificationsMailer.live_conferences_digest(live_conferences,subscription.email,subscription.topic).deliver
    end
  end
end