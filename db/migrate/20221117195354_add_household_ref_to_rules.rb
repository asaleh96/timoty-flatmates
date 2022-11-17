class AddHouseholdRefToRules < ActiveRecord::Migration[7.0]
  def change
    add_reference :rules, :household, null: false, foreign_key: true
  end
end
