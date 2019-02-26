class AddNextActionPayColumnsToProspect < ActiveRecord::Migration
  def change
    add_column :prospects, :pay_next_action_date, :date
    add_column :prospects, :pay_next_action, :string
  end
end
