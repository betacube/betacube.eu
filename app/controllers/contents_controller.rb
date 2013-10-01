class ContentsController < ApplicationController
  before_filter :get_current_page

  require 'open-uri'
  require 'json'

  def show
    render :template => "content/#{@page}"
  end

private

  def get_current_page
    @page = request.path.gsub("/","_")[1..-1]
  end

end