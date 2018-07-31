class CheckStreakResetJob < ApplicationJob

  def perform
    # find all active streaks 👇
    streaks = Streak.where(status: "active")
    # loop through each streak => if reset value is == true (which happens on update action) then flip it to false
    # else status = "finished"
    streaks.each do |streak|
      if streak.reset?
       streak.update!(reset: false)
      else
       streak.update!(status: 1, end_date: Time.now)
      end
      streak.save!
    end
  end
end
