module PagesHelper

  def activity_title_helper
    titles = []
    current_user.activities.each do |t|
      titles << t.title
    end
    return raw titles
  end

end
