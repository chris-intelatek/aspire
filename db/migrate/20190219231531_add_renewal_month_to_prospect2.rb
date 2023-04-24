class AddRenewalMonthToProspect2 < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :hcs_renewal_month, :string
  end
end
