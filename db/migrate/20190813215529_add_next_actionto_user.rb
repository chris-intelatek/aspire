class AddNextActiontoUser < ActiveRecord::Migration
  def change
    add_column :users, :user_next_action_date, :date
    add_column :users, :user_next_action, :text
    add_column :users, :list_companies, :text
  end
end