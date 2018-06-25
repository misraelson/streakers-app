class AddActivityReferenceToStreaks < ActiveRecord::Migration[5.2]
  def change
    add_reference :streaks, :activity, foreign_key: true
  end
end
