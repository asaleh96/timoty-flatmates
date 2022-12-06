class AddDueDateToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :due_date, :date
  end
end
