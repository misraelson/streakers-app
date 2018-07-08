class ActivitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :title
  has_many :streaks
  belongs_to :user
end
