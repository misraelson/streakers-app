module ActivitiesHelper

  def activity_streaks_helper(activity_streaks)
    numbers = []
    activity_streaks.each do |streak|
      numbers << streak.current_streak
    end
    return numbers
  end

end
