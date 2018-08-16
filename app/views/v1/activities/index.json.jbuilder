json.array! @activities do |activity|
  json.partial! 'v1/activities/activity', activity: activity

  json.streaks activity.streaks.order("created_at ASC"), :id, :current_streak, :status, :reset, :activity_id
end
