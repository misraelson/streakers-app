class Activity < ApplicationRecord

  has_many :streaks
  belongs_to :user
end
