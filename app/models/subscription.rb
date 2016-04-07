class Subscription < ActiveRecord::Base
  belongs_to :topic

  class << self
    def add(parameters)
      create!(parameters)
    end
  end
end
