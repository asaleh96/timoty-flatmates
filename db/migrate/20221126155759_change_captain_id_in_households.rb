class ChangeCaptainIdInHouseholds < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :households, column: :captain_id
    add_foreign_key :households, :users, column: :captain_id
  end
end
