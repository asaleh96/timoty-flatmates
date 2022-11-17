class AddInfoToRules < ActiveRecord::Migration[7.0]
  def change
    add_column :rules, :household_id, :integer
    add_column :rules, :name, :string
  end
end
