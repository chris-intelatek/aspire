class RegistrationsController < Devise::RegistrationsController
  include CookieManager
  before_action :set_group, only: %i[new create]
  before_action :ensure_group_is_set, only: %i[new create]

  private

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:group]
  end

  def sign_up_params
    params.require(:user).permit(:advisor_first_name, :advisor_last_name, :advisor_phone, :advisor_mobile, :admin, :manager, :support, :email, :password, :password_confirmation, :group,  :mailing_address, :apt_suite, :city, :state, :zip, :agree)
  end

  def account_update_params
    params.require(:user).permit(:advisor_first_name, :advisor_last_name, :advisor_phone, :advisor_mobile, :admin, :manager, :support, :email, :password, :password_confirmation, :current_password, :group,  :mailing_address, :apt_suite, :city, :state, :zip, :agree)
  end
  
  def set_group
    @group_id = params[:group]
  end
  
  def ensure_group_is_set
    if @group_id.blank? || User.find_by(user_code: @group_id).blank?
      redirect_to new_user_session_path, flash: { danger:  'Please contact your administrator.' } and return 
    end
  end
  
end