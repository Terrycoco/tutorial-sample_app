module ApplicationHelper

  #returns the full project title and page name
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end



end
