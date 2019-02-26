module ProspectsHelper

  # Dashboard

  def cps_all_closed
    @prospects.where(hcs_status: "Closed - Client is Active").count +
    @prospects.where(hcs_status: "Intro Presentation Given - No Sale").count +
    @prospects.where(hcs_status: "SME Presentation Done - No Sale").count +
    @prospects.where(hcs_status: "Proposal Given - No Sale").count +
    @prospects.where(hcs_status: "Not Qualified").count +
    @prospects.where(hcs_status: "Other - No Sale").count
  end

  def pay_all_closed
    @prospects.where(hcs_status: "Closed - Client is Active").count +
    @prospects.where(hcs_status: "Intro Presentation Given - No Sale").count +
    @prospects.where(hcs_status: "SME Presentation Done - No Sale").count +
    @prospects.where(hcs_status: "Not Qualified").count +
    @prospects.where(hcs_status: "Other - No Sale").count
  end

  def hcs_all_closed
    @prospects.where(hcs_status: "Closed - Group is Effective").count +
    @prospects.where(hcs_status: "Intro Presentation Given - No Sale").count +
    @prospects.where(hcs_status: "SME Presentation Done - No Sale").count +
    @prospects.where(hcs_status: "Proposal Given - No Sale").count +
    @prospects.where(hcs_status: "Not Qualified").count +
    @prospects.where(hcs_status: "Other - No Sale").count
  end

end