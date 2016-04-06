class ConferenceObserver < ActiveRecord::Observer
  include ConferencesHelper
  def after_create(conference)
    subscribers = get_subscribers(conference)
    if subscribers.count > 0
      NotificationsMailer.conference_notification(conference,subscribers).deliver
      NotificationsMailer.cfp_notification(conference,subscribers).deliver
    end
  end
end