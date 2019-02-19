class AddSubmittedToProspect < ActiveRecord::Migration
  def change
    add_column :prospects, :hcs_prospect, :boolean, default: false
    add_column :prospects, :cps_prospect, :boolean, default: false
  end
end