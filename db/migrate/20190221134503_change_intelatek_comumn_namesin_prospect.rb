class ChangeIntelatekComumnNamesinProspect < ActiveRecord::Migration[7.0]
  def change
    rename_column :prospects, :hcs_intelatek_bda, :intelatek_bda
    rename_column :prospects, :hcs_intelatek_notes, :intelatek_notes
    rename_column :prospects, :hcs_intelatek_day, :intelatek_day
    rename_column :prospects, :hcs_intelatek_timezone, :intelatek_timezone
    rename_column :prospects, :hcs_intelatek_time, :intelatek_time
    remove_column :prospects, :cps_intelatek_bda, :string
    remove_column :prospects, :cps_intelatek_notes, :text
    remove_column :prospects, :cps_intelatek_day, :string
    remove_column :prospects, :cps_intelatek_timezone, :string
    remove_column :prospects, :cps_intelatek_time, :string
  end
end
