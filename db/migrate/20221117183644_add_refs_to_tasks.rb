class AddRefsToTasks < ActiveRecord::Migration[7.0]
  def change
    change_table :tasks do |t|
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.references :assignee, null: true, foreign_key: { to_table: :users }
    end
  end
end
