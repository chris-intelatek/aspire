module ApplicationHelper
    
  def avatar_url(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
    
  def total_agents  
    @users.where(group: "ajrc").count +
  	@users.where(group: "ac").count +
		@users.where(group: "cc").count +
		@users.where(group: "cn").count +
		@users.where(group: "ls").count +
		@users.where(group: "ne").count +
		@users.where(group: "rs").count +
		@users.where(group: "se").count +
		@users.where(group: "td").count +
		@users.where(group: "tz").count
  end

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