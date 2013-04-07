module ApplicationHelper

  #Вертає повний заголовок або без вертикальної риски

  def full_title(page_title)
    base_title = t :base_title
    if page_title.empty?
      base_title
    else
      "#{base_title}| #{page_title}"
    end

  end
end
