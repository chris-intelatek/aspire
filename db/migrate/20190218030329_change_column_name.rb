class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :prospects, :intro_presentation_date, :hcs_intro_presentation_date
    rename_column :prospects, :current_health_benefit_cost, :hcs_current_health_benefit_cost
    rename_column :prospects, :status, :hcs_status
    rename_column :prospects, :agreement_date, :hcs_agreement_date
    rename_column :prospects, :hcs_sme_proposal_meeting_date, :hcs_proposal_meeting_date
    rename_column :prospects, :intro_presenter, :hcs_intro_presenter
    rename_column :prospects, :effective_date, :hcs_agreement_date
    rename_column :prospects, :hcbq_current_carrier, :hcs_current_carrier
    rename_column :prospects, :hcbq_current_coverage_type, :hcs_current_coverage_type
    rename_column :prospects, :intelatek_bda, :hcs_intelatek_bda
    rename_column :prospects, :intelatek_notes, :hcs_intelatek_notes
    rename_column :prospects, :intelatek_day, :hcs_intelatek_day
    rename_column :prospects, :intelatek_timezone, :hcs_intelatek_timezone
    rename_column :prospects, :intelatek_time, :hcs_intelatek_time
  end
end
