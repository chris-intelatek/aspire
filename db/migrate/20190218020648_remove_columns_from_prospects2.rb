class RemoveColumnsFromProspects2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :prospects, :new_estimated_health_benefit_cost, :decimal
    remove_column :prospects, :savings_percentage, :decimal
    remove_column :prospects, :close_date, :date
    remove_column :prospects, :hcbq_business_type, :string
    remove_column :prospects, :hcbq_no_of_eligible_employees, :integer
    remove_column :prospects, :hcbq_total_participation, :integer
    remove_column :prospects, :hcbq_most_important, :text
    remove_column :prospects, :hcbq_sustainable, :string
    remove_column :prospects, :hcbq_oop, :string
    remove_column :prospects, :hcbq_like_best, :text
    remove_column :prospects, :hcbq_like_least, :text
    remove_column :prospects, :hcbq_scale, :integer
    remove_column :prospects, :hcbq_perfect_plan, :text
    remove_column :prospects, :hcbq_notes, :text
    remove_column :prospects, :hcs_monthly_savings_fee, :decimal
    remove_column :prospects, :hcs_pepm_fee, :decimal
    remove_column :prospects, :submitted_hcsq, :boolean
  end
end