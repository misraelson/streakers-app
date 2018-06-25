class Streak < ApplicationRecord
  enum status: { active: 0, finished: 1 }
  belongs_to :activity
end
