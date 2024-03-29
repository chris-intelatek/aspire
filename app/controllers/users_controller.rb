class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:show]
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
      render(:template => 'application/dashboard')
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
      GroupMessageWorker.perform_async(current_user, params[:subject], params[:body])
      flash[:success] = "Messages Successfully Sent to Group."
      redirect_to users_path
    end
  end


  private
  
  def set_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:advisor_first_name, :advisor_last_name, :advisor_phone, :advisor_mobile, :admin, :manager, :support, :email, :password, :password_confirmation, :current_password, :group,  :mailing_address, :apt_suite, :city, :state, :zip, :agree, :user_code, :notes, :user_next_action_date, :user_next_action, :list_companies)
  end
  
end