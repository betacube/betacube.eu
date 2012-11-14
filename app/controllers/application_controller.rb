class ApplicationController < ActionController::Base
  before_filter :current_page
  before_filter :generate_menu_items

  protect_from_forgery

  def current_page
    unless @page
      @page = "home"
    end
  end

  def generate_menu_items
    @menu = {
      :home => [],
      :events => [
        :show_and_tell,
        :meetups,
        :students_fair,
      ],
      :about => [],
      :open_source => [],
      :contact => []
    }
  end

end
