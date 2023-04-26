class AddNewHcsCostsToProspect < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :hcs_new_cost, :decimal, default: 0.0, null: false
  end
end