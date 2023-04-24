class ChangeHourlyColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :prospects, :hourly_employees, :pay_hourly_employees
  end
end
