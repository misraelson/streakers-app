json.streak do
    json.partial! 'v1/streaks/streak', streak: @streak
end
