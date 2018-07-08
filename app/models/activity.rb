class Activity < ApplicationRecord
  # attr_accessor :id, :title, :streak_id, :user_id

  belongs_to :user
  has_many :streaks, dependent: :destroy
end
