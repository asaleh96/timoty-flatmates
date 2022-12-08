class AddDescriptionToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :description, :text
  end
end
