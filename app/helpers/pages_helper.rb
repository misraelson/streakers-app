module PagesHelper

  def activity_title_helper
    streaks = current_user.streaks.order! 'created_at DESC'
    activity_ids = []
    streaks.each do |aid|
      activity_ids << aid.activity_id
    end
    titles = []
    activity_ids.each do |f|
      a = Activity.find(f)
      titles << a.title
    end
    return raw titles.uniq!
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
