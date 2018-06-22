class Activity < ApplicationRecord
  enum status: { active: 0, finished: 1 }
end
