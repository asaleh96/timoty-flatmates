class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :content
      t.references :household, null: false, foreign_key: true

      t.timestamps
    end
  end
end
