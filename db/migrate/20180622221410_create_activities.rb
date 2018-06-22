class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
