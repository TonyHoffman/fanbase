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
    image_tag("tb_rect_logo.png", :size => "207x40", :alt => "Trending Buffalo", 
                                  :class => "myfooter")
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
  
  def player_pick_info(player_id, contest_id)
    player_info = Player.find(:all, 
                  :conditions => ["id = ?", player_id])[0].player_name
    count = Branch.find(:all, 
            :conditions => ["player_id = ? and contest_id =?", player_id, 
            contest_id]).count
    if count < 2 then count = 'You own this pick'
    else 
      count - 1 
      player_info + ' (' + pluralize(count, 'other') + ')'
    end
  end
  
  def event_pick_info(event_id, contest_id)
    event_info = Event.find(:all, 
                  :conditions => ["id = ?", event_id])[0].description
    count = Branch.find(:all, 
            :conditions => ["event_id = ? and contest_id =?", event_id, 
            contest_id]).count
    if count < 2 then count = 'You own this pick' 
      else 
        count - 1 
        event_info + ' (' + pluralize(count, 'other') + ')'
      end

  end
  
  
end
