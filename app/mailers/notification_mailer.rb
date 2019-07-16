class NotificationMailer < ApplicationMailer
    
  def group_message(data,email,subject)
    @users = User.my_users.all
    @body=data
    mail(from: [current_user.advisor_name, current_user.email],
        to: [@users.user_email, 'chris@aspirepartners.co'],
         subject: subject)
  end


  def new_hcsq(prospect)
    @prospect = prospect
    mail(to: [prospect.user_email, 'chris@bluecoastsavings.com'],
         subject: 'New HCSQ Submitted')
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