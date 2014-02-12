class CalendarController < ApplicationController
  
  def index
  	add_breadcrumb "Event Calendar",calendar_path
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)

    @nearest_events = Event.find(:all, :conditions => ['start_at >= ?', Date.today], :order => "start_at", :limit => 5)
  end
  
end
