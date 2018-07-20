json.array! @activities do |activity|
  json.partial! 'v1/activities/activity', activity: activity
end
