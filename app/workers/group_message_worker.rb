class GroupMessageWorker
    include SuckerPunch::Job
    
    def perform(current_user, email_subject, email_body)
      user_ids = User.my_users(current_user).pluck(:id) << current_user.id

      
      users =  User.where(id: user_ids)
      
      users.each do |user|
        NotificationMailer.group_message(user, current_user, email_subject, email_body).deliver_later
      end
    end
end