class AddResetToStreaks < ActiveRecord::Migration[5.2]
  def change
    add_column :streaks, :reset, :boolean, default: true
  end
end
