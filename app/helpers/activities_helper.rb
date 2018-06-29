module ActivitiesHelper

  def activity_streaks_helper(activity_streaks)
    numbers = []
    activity_streaks.each do |streak|
      numbers << streak.current_streak
    end
    return numbers
  end

  # def activity_streak_update_helper(activity)
  #   @streak = activity.streaks.find_by(status: "active")
  # end

end
