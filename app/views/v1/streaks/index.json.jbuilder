json.array! @streaks do |streak|
  json.partial! 'v1/streaks/streak', streak: streak
end
