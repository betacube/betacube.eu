module ApplicationHelper

  def main_title
    "Betacube | #{@page_title}"
  end

  def flash_class(level)
    case level
    when :notice
      "info"
    when :error
      "error"
    when :alert
      "warning"
    end
  end

end
