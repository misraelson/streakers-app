class CreateStreaks < ActiveRecord::Migration[5.2]
  def change
    create_table :streaks do |t|
      t.integer :current_streak
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
