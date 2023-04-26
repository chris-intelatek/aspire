class AddPayColumnsToProspect < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :pay_prospect, :boolean, default: false
    add_column :prospects, :hourly_employees, :integer
  end
end