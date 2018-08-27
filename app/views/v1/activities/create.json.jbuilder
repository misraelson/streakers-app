json.activity do
  json.partial! 'v1/activities/activity', activity: activity

# adding streaks to send back an empty streaks array
  json.streaks activity.streaks, :id, :current_streak, :status, :reset, :activity_id
end
