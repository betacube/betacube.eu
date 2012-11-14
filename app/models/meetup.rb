class Meetup

  attr_accessor :id
  attr_accessor :title
  attr_accessor :description
  attr_accessor :venue_name
  attr_accessor :venue_lat
  attr_accessor :venue_lon
  attr_accessor :venue_address
  attr_accessor :venue_url
  attr_accessor :start_date
  attr_accessor :end_date
  attr_accessor :tags
  attr_accessor :attendees

  def initialize(meetup, startdate, enddate, venue=nil)
    @id = meetup["id"]
    @title = meetup["title"]
    @description = meetup["title"]
    @start_date = startdate
    @end_date = enddate
    @tags = meetup["tags"]
    @attendees = meetup["attendees"]

    if venue
      @venue_name = venue["name"]
      @venue_lat = venue["lat"]
      @venue_lon = venue["lon"]
      @venue_address = venue["address"]
      @venue_url = venue["url"]
    end
  end

  def self.new_from_json(meetup)
    if meetup["tags"].include?("meetup")
      startdate = DateTime.parse(meetup["startdate"]) rescue nil
      enddate = DateTime.parse(meetup[:enddate]) rescue nil
      venue = meetup["venue"]
      Meetup.new(meetup, startdate, enddate, venue)
    end
  end

  def date
    "#{self.start_date.strftime("%m.%d.%Y @ %H:%M")}"
  end

  def url
    "http://www.techup.lu/#{self.id}"
  end
  
  def url_to_attendee(attendee)
    "http://twitter.com/#{attendee}"
  end

end