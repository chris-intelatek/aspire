class ChangeApColumnName < ActiveRecord::Migration
  def change
    rename_column :prospects, :ap_intro_presentation_date, :cps_intro_presentation_date
    rename_column :prospects, :ap_sme_fact_finding_call_date, :cps_sme_fact_finding_call_date
    rename_column :prospects, :ap_total_ap, :cps_total_cps
    rename_column :prospects, :ap_status, :cps_status
    rename_column :prospects, :ap_agreement_date, :cps_agreement_date
    rename_column :prospects, :ap_supplier_match_meeting_date, :cps_supplier_match_meeting_date
    rename_column :prospects, :ap_intro_presenter, :cps_intro_presenter
    rename_column :prospects, :ap_sme, :cps_sme
    rename_column :prospects, :ap_intelatek_bda, :cps_intelatek_bda
    rename_column :prospects, :ap_intelatek_notes, :cps_intelatek_notes
    rename_column :prospects, :ap_intelatek_day, :cps_intelatek_day
    rename_column :prospects, :ap_intelatek_timezone, :cps_intelatek_timezone
    rename_column :prospects, :ap_intelatek_time, :cps_intelatek_time
  end
end