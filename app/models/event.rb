class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :user
  validates :name, presence:true
end
