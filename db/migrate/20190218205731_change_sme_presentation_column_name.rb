class ChangeSmePresentationColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :prospects, :hcs_sme_fact_finding_call_date, :hcs_sme_presentation_date
    rename_column :prospects, :cps_sme_fact_finding_call_date, :cps_sme_presentation_date
  end
end