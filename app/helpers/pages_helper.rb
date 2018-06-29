module PagesHelper

  def activity_title_helper
    titles = []
    activities = current_user.activities.order! 'created_at DESC'
    activities.each do |t|
      titles << t.title
    end
    return raw titles
  end

  def activity_streaks_data_helper
    # maybe query current_user.activities active?
    # create a variable that is all streaks ordered by created_at DESC then loop through all those streaks and filter by unique activity_id
    # then shovel current_streak into empty numbers array
    numbers = []
    streaks = current_user.streaks.order! 'created_at DESC'
    s2 = streaks.uniq{|x| x.activity_id}
      s2.each do |streak|
        numbers << streak.current_streak
      end
    return numbers
  end

end
