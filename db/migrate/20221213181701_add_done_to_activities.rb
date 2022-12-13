class AddDoneToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :done, :boolean, default: false
  end
end
