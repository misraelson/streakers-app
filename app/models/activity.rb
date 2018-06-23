class Activity < ApplicationRecord
  enum status: { active: 0, finished: 1 }

  has_many :streaks
  belongs_to :user
end
