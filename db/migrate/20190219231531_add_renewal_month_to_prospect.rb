class AddRenewalMonthToProspect < ActiveRecord::Migration
  def change
    add_column :prospects, :hcs_renewal_month, :string
  end
end
