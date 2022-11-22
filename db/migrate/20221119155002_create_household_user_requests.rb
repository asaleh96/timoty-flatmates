class CreateHouseholdUserRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :household_user_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :household, null: false, foreign_key: true
      t.boolean :approved

      t.timestamps
    end
  end
end
