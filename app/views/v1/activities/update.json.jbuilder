json.data do
  json.(@activity, :id, :title, :user_id)

  json.streaks @activity.streaks, :id, :current_streak, :status, :reset, :activity_id
end

# json.data do
#   json.@activity do
#     json.partial! 'v1/activities/activity', activity: activity
#
#     json.streaks activity.streaks, :id, :current_streak, :status, :reset, :activity_id
#   end
# end
