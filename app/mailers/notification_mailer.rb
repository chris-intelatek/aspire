class NotificationMailer < ApplicationMailer


  def group_message(user, from_user, subject, content)
    @user = user
    @content = content
    mail(from: "#{from_user.advisor_name}<#{from_user.email}>",
         to: user.email,
         subject: subject)
  end


  def new_agent_welcome(user)
    @user = user
    
    if @user.group == "cc"
      manager_email = 'chris@aspirepartners.co'
    elsif @user.group == "rs" 
      manager_email = 'robert.sawyer@aspirepartners.co'
    elsif @user.group == "ne" 
      manager_email = 'neil.evans@aspirepartners.co'
  	elsif @user.group == "ls" 
  	  manager_email = 'laura.sardilli@aspirepartners.co'
  	elsif @user.group == "ac" 
  	  manager_email = 'andy.charles@aspirepartners.co'
  	elsif @user.group == "se" 
  	  manager_email = 'stephanie.elad@aspirepartners.co'              	  
  	elsif @user.group == "cn" 
  	  manager_email = 'chris.napier@aspirepartners.co'
  	elsif @user.group == "ajrc" 
  	  manager_email = 'alan.callaghan@aspirepartners.co'
  	elsif @user.group == "tz" 
  	  manager_email = 'terri.zielonko@aspirepartners.co'              	  
  	elsif @user.group == "td" 
  	  manager_email = 'thomas.depaola@aspirepartners.co'
  	end

    mail(
        from: "Aspire <#{manager_email}>",
        to: user.email,
        cc: [manager_email, 'admin@aspirepartners.co', 'laura@aspirepartners.co', 'shawn@bluecoastsavings.com'],
        # bcc: ['admin@aspirepartners.co', 'laura@aspirepartners.co', 'shawn@bluecoastsavings.com'],
        subject: 'Welcome to Aspire'
        )
  end

  
  def new_meeting(prospect)
    @prospect = prospect
    mail(to: [prospect.user_email, 'appointments@intelatek.com'],
         subject: 'New HCS Meeting Scheduled')
  end

  
  def new_comment(comment)
    @comment = comment
    mail(to: [comment.prospect.user_email],
         subject: 'New Comment Submitted')
  end
  
  
end