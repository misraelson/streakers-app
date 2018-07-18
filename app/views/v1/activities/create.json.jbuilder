json.user do
  json.partial! 'v1/activities/activity', activity: @activity
end
