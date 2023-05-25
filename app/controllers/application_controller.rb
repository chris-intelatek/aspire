class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
   
  def dashboard
    @prospects = current_user.my_prospects
    @users = User.my_users(current_user)
  end
end