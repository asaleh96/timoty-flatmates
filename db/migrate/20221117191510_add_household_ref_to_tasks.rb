class AddHouseholdRefToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :household, null: false, foreign_key: true
  end
end
