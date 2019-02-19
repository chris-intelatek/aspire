class AddColumnsToProspect < ActiveRecord::Migration
  def change
    add_column :prospects, :ap_intro_presentation_date, :date  
    add_column :prospects, :ap_sme_fact_finding_call_date, :date
    add_column :prospects, :ap_total_ap, :decimal, default: 0.0, null: false
    add_column :prospects, :ap_status, :string
    add_column :prospects, :ap_agreement_date, :date
    add_column :prospects, :ap_supplier_match_meeting_date, :date
    add_column :prospects, :ap_intro_presenter, :string
    add_column :prospects, :ap_sme, :string
    add_column :prospects, :ap_intelatek_bda, :string
    add_column :prospects, :ap_intelatek_notes, :text
    add_column :prospects, :ap_intelatek_day, :string
    add_column :prospects, :ap_intelatek_timezone, :string
    add_column :prospects, :ap_intelatek_time, :string
  end
end
