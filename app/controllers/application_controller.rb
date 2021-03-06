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
        :students_fair,
      ],
      :meetups => [
        :hyperlink,
        :hyperlink_1,
        :hyperlink_2,
        :hyperlink_3,
        :hyperlink_4
      ],
      :about => [],
      :open_source => [],
      :contact => []
    }
  end

end
