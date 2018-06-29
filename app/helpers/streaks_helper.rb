module StreaksHelper

  def streaks_title_helper(streaks)
    titles = []
    streaks.each do |streak|
      titles << streak.activity.title
    end
    return raw titles
  end

  def streaks_data_helper(streaks)
    data = []
    streaks.each do |streak|
      data << streak.current_streak
    end
    return data
  end

end
