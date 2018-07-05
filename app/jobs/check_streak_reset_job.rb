class CheckStreakResetJob < ApplicationJob

  def perform
    # find all active streaks
    streaks = Streak.all.where(status: "active")
    # loop through each streak and if reset value is == true (which happens on update action) then set it to false
    # else if streak has not been reset set status = "finished"
    streaks.each do |streak|
      if streak.reset?
       streak.update!(reset: "false")
      else
       streak.update!(status: 1, end_date: Time.now)
      end
      streak.save!
    end
  end
end
