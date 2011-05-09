module ApplicationHelper
  def show_flash_messages
    output = ''
    [:notice, :info, :warning, :error].each do |level|
      Rails.logger.warn(level.to_s + ": " + flash[level].inspect)
      if flash[level]
        output += content_tag(:div, :class => level) do
          content_tag :p, h(flash[level])
        end
      end
    end
    if output.blank?
      nil
    else
      content_tag(:div, output.html_safe, :id => 'communication')
    end
  end
end
