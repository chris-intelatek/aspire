class AddMorePayColumnsToProspect < ActiveRecord::Migration
  def change
    add_column :prospects, :pay_intro_presentation_date, :date
    add_column :prospects, :pay_intro_presenter, :string
    add_column :prospects, :pay_sme_presentation_date, :date
    add_column :prospects, :pay_sme, :string
    add_column :prospects, :pay_status, :string
    add_column :prospects, :pay_agreement_date, :date
  end
end
