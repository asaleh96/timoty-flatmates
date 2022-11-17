class AddInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :earned_points, :integer
    add_column :users, :give_points, :integer
    add_column :users, :birthday_date, :date
    add_column :users, :status, :text
  end
end
