class RemoveHouseholdRefFromRules < ActiveRecord::Migration[7.0]
  def change
    remove_column :rules, :household_id
  end
end
