class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.references :household, foreign_key: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
