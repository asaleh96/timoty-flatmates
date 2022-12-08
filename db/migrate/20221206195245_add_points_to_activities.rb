class AddPointsToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :points, :integer
  end
end
