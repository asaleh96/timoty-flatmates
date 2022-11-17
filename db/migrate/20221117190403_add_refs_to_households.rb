class AddRefsToHouseholds < ActiveRecord::Migration[7.0]
  def change
    change_table :households do |t|
      t.references :captain, null: false, foreign_key: { to_table: :users }
    end
  end
end
