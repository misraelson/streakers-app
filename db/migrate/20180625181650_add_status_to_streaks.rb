class AddStatusToStreaks < ActiveRecord::Migration[5.2]
  def change
    add_column :streaks, :status, :integer, default: 0
  end
end
