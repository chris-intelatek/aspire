class ChangeHourlyColumnName < ActiveRecord::Migration
  def change
    rename_column :prospects, :hourly_employees, :pay_hourly_employees
  end
end
