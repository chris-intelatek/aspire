class AddUserCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_code, :string
  end
end
