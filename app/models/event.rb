class Event < ActiveRecord::Base
  has_event_calendar

  validates :name, presence:true
end
