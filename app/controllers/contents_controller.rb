class ContentsController < ApplicationController
  before_filter :get_current_page
  before_filter :load_meetups_from_techup

  require 'open-uri'
  require 'json'

  def show
    render :template => "content/#{@page}"
  end

private

  def get_current_page
    @page = request.path.gsub("/","_")[1..-1]
  end

  def load_meetups_from_techup
    if @page == "events_meetups"
      @meetups = []
      api_url = "#{APP_CONFIG["techup"]["endpoint"]}#{APP_CONFIG["techup"]["user"]}"

      if result = JSON.parse(open(api_url).read)
        result["user"]["submitted"].each do |meetup|
          @meetups << Meetup.new_from_json(meetup) if meetup["twitterhandler"] == "betacube"
        end
      end
      @meetups = @meetups.compact.sort_by(&:start_date).reverse.partition{|meetup| meetup.start_date < DateTime.now }
    end

  end

end