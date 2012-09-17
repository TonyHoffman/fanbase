module ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title = "Fanbase"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("TBLogo.jpg", :size => "80x80", :alt => "Trending Buffalo", :class => "round")
  end
  
  def body_class
    if !current_user.admin? 
      @body_class = "body"
    else
      @body_class = " id='#{body_class}'"
    end
    # if !admin? 
    #   base_body
    # else
    #   admin_body
    # end
  end
  
  
  def data_theme
    app_data_theme = " data-theme='b'"
  end
  
  def sortable (column, title = null)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
  
  
  
  
end
