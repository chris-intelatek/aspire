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
    mail(to: [user.email, 'chris@aspirepartners.co'],
         subject: 'Welcome to Aspire')
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