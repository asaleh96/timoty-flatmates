class RemoveUserRefFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tasks, :user, foreign_key: true, index: false
  end
end
