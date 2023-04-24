class AddNextActiontoUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_next_action_date, :date
    add_column :users, :user_next_action, :text
    add_column :users, :list_companies, :text
  end
end