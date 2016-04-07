class NotificationsMailer < ActionMailer::Base
  include ConferencesHelper
  default from: "\"ConferenceBuzz\" <conference.buzz@gmail.com>"

  def conference_notification(conference,subscribers)
    @conference = conference
    message = "#{conference.title} to happen from #{conference.from_date.to_formatted_s(:long)} to #{conference.to_date.to_formatted_s(:long)} at #{conference.venue_city},#{conference.venue_country}"
    mail( :to => subscribers, :subject => message )
  end

  def cfp_notification(conference,subscribers)
    @conference = conference
    message ="Call for Proposals open for #{conference.title} from #{conference.cfp_opens_on.to_formatted_s(:long)} to #{conference.cfp_closes_on.to_formatted_s(:long)} at #{conference.venue_city},#{conference.venue_country}"
    mail( :to => subscribers, :subject => message )
  end

  def live_conferences_digest(conferences,subscriber,topic)
    @conferences = conferences
    message = "Following are the upcoming conferences on #{topic.name.humanize}"
    mail(:to => subscriber, :subject => message)
  end
end
