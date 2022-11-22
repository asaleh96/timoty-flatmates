class AddIsCaptainToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_captain, :boolean, default: false
  end
end
