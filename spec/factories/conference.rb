FactoryGirl.define do
	factory :conference do
	    title "My conference"
	    url "http://www.google.com"
	    from_date Date.today
	    to_date Date.today + 1
	    venue_city "mumbai"
	    venue_country "india"
	    cfp_opens_on Date.today - 7
	    cfp_closes_on Date.today - 4
	    created_by "Aastha Kesarwani"
	    created_by_email "aastha@gmail.com"
	    topic_id 1
	end
end