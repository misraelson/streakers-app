class RemoveStatusFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :status, :integer
  end
end
