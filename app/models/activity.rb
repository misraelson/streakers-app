class Activity < ApplicationRecord

  belongs_to :user
  has_many :streaks, dependent: :destroy
end
