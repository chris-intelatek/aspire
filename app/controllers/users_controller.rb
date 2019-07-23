class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_action :set_user, only: [:show, :edit, :destroy, :update]


  def index
    if params[:search]
      @users = User.my_users(current_user).search(params[:search]).order("created_at DESC")
    else
      @users = User.my_users(current_user)
      
      respond_to do |format|
        format.html
        format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
      end   
      
    end
  end

  def show
  end

  def start_page
    if current_user.manager
      @users = User.all
      @prospects = Prospect.all
      render(:template => 'prospects/dashboard')
    else
      render(:template => 'pages/home')
    end
  end

  def edit
  end
  
  def destroy
    @user.destroy
    redirect_to users_path
  end
  
  def update
	  if @user.update_attributes(user_params)
		  redirect_to users_path
	  else
	  	render 'edit'
	  end
  end


  def group_message
    if request.post?
      user_ids = User.my_users(current_user).pluck(:id) << current_user.id
      subject = params[:subject]
      content = params[:body]
      
      @users =  User.where(id: user_ids)
      
     @users.each do |user|
        NotificationMailer.group_message(user, current_user, subject, content).deliver_later
      end
      flash[:success] = "Messages Successfully Sent to Group."
      redirect_to users_path
    end
  end


  private
  
  def set_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:advisor_first_name, :advisor_last_name, :advisor_phone, :advisor_mobile, :admin, :manager, :support, :email, :password, :password_confirmation, :current_password, :group,  :mailing_address, :apt_suite, :city, :state, :zip, :agree, :user_code, :notes)
  end
  
end