class ChangeTotalApColumnName < ActiveRecord::Migration
  def change
    rename_column :prospects, :cps_total_cps, :cps_total_ap
  end
end