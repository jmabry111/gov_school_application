module ApplicationHelper
  #Returns the full title on a per-page basisi
  def full_title(page_title)
    base_title = "Governor's School Application"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
