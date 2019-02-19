module ProspectsHelper

  # Dashboard
  
  def hcs_all_in_crm
    @prospects.where.not(hcs_status: nil).count
  end

  def hcs_no_sale
    @prospects.where(hcs_status: "Intro Pres Given - No Sale").count +
    @prospects.where(hcs_status: "sme pRESENTATIONgIVEN Done - No Sale").count +
    @prospects.where(hcs_status: "Proposal Given - No Sale").count +
    @prospects.where(hcs_status: "Not Qualified").count +
    @prospects.where(hcs_status: "Other - No Sale").count
  end

end