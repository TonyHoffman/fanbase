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
  
  def sponsor_logo
    image_tag("tb_rect_logo.png", :size => "207x40", :alt => "Trending Buffalo")
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
    app_data_theme = " data-theme='e'"
  end
  
  def sortable (column, title = null)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
  
  
  def this_user_contest_branches(user_id, contest_id)
    @branches = Branch.find(:all, 
                  :conditions => ["user_id = ? and contest_id = ?", user_id,
                  contest_id], :order => 'stack_order')
  end
  
  def player_pick_info(contest_id, stack_order, player_id, event_id, prev_01, prev_02, prev_03)
    player_info = Player.find(:all, 
                  :conditions => ["id = ?", player_id])[0].player_name
    player_info + ' (' + show_odds_this_branch(contest_id, stack_order, player_id, event_id, prev_01, prev_02, prev_03) + ')'
  end
  
  def event_pick_info(contest_id, stack_order, player_id, event_id, prev_01, prev_02, prev_03)
    event_info = Event.find(:all, 
                  :conditions => ["id = ?", event_id])[0].description
    event_info + ' (' + show_odds_this_branch(contest_id, stack_order, player_id, event_id, prev_01, prev_02, prev_03) + ')'
  end
  
  def count_these_first_branches
    ctfb = Branch.find(:all, 
            :conditions => ["player_id = ? and contest_id =?", player_id, 
            contest_id]).count
  end
  
end
