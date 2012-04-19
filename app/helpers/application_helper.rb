module ApplicationHelper
  def notice_message
    flash_messages = []

    flash.each do |type, message|
      type = "alert-success" if type == :notice
      type = "alert-success" if type == :success
      text = content_tag(:div, link_to("x", "#", :class => "close", 'data-dismiss' => 'alert') + message, :class => "alert #{type}")
      flash_messages << text if message
    end

    flash_messages.join("\n").html_safe
  end
  
  def render_page_title
    title = @page_title ? "#{@page_title} | #{SITE_NAME}" : SITE_NAME rescue "SITE_NAME"
    content_tag("title", title, nil, false)
  end
end
