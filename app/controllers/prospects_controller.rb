class ProspectsController < ApplicationController
  before_action :find_prospect, only: [:show, :edit, :update, :destroy, :hcsq, :hcsq_update, :hcs, :hcs_update, :cps, :cps_update, :pay, :pay_update]
  skip_before_action :authenticate_user!, only: [:new_lead, :new_lead_create]
  
  def index
    if params[:status] == nil

      if params[:search]
        @prospects = Prospect.search(params[:search]).order("created_at DESC")
      else
        @prospects = Prospect.all.order('user_id DESC')
      end

    else
      @prospects = Prospect.where(status: params[:status])
    end
    @hcs_status = Prospect.select(:hcs_status).order(:hcs_status).distinct
    
    respond_to do |format|
      format.html
      format.csv { send_data @prospects.to_csv, filename: "Prospects-#{Date.today}.csv" }
    end
  end
  
  
  def index
    @hcs_status = Prospect.select(:hcs_status).order(:hcs_status).distinct
    @pay_status = Prospect.select(:pay_status).order(:pay_status).distinct
    @cps_status = Prospect.select(:cps_status).order(:cps_status).distinct
    if params[:hcs_status] != nil
      @prospects = Prospect.where(hcs_status: params[:hcs_status])
      elsif params[:pay_status] != nil
        @prospects = Prospect.where(pay_status: params[:pay_status])
      elsif params[:cps_status] != nil
        @prospects = Prospect.where(cps_status: params[:cps_status])
      elsif params[:search]
        @prospects = Prospect.search(params[:search]).order("created_at DESC")
      elsif
        @prospects = Prospect.all.order('user_id DESC')
    end

    respond_to do |format|
      format.html
      format.csv { send_data @prospects.to_csv, filename: "Prospects-#{Date.today}.csv" }
    end
  end  
  
  
  def show
  end

  # def dashboard
  #   @prospects = Prospect.all
  #   @users = User.all
  #   @users = User.my_users(current_user)
  # end

  def intelatek
    @prospects = Prospect.all.order("created_at DESC")
    @users = User.all
  end
  
  def new
    @prospect = current_user.prospects.build
  end
  
  def create
    @prospect = current_user.prospects.build(prospect_params)
    if @prospect.save
      flash[:success] = "New prospect added."
      redirect_to prospects_path
    else
      render 'new'
    end
  end
  
  def new_lead
    @prospect = Prospect.new
  end
  
  def new_lead_create
    @prospect = Prospect.new(prospect_params)
    if @prospect.save
      NotificationMailer.new_meeting(@prospect).deliver_later
      flash[:success] = "New prospect added."
      redirect_to 'http://intelatek.com/intranet/submitted.html'
    else
      render 'new_lead'
    end
  end

  def edit
  end

  def cps
  end
  
  def cps_update
    if @prospect.update(prospect_params)
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'cps'
    end
  end

  def pay
  end
  
  def pay_update
    if @prospect.update(prospect_params)
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'pay'
    end
  end

  def hcs
  end
  
  def hcs_update
    if @prospect.update(prospect_params)
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'hcs'
    end
  end

  def hcsq
  end
  
  def hcsq_update
    if @prospect.update(prospect_params)
      NotificationMailer.new_hcsq(@prospect).deliver_later
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'bchq'
    end
  end
  
  def update
    if @prospect.update(prospect_params)
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @prospect.destroy
    flash[:danger] = "Prospect has been deleted."
    redirect_to root_path
  end

  private
    def prospect_params
      params.require(:prospect).permit(:user_id, :organization, :street_address, :address2, :city, :state, :zip, :phone, :website, :employees, :prospect_note, :created_at, :updated_at, :hcs_intro_presentation_date, :hcs_sme_presentation_date, :hcs_current_health_benefit_cost, :hcs_status, :hcs_agreement_date, :user_id, :hcs_proposal_meeting_date, :contact1_first_name, :contact1_last_name, :contact1_title, :contact1_phone, :contact1_mobile, :contact1_email, :contact2_first_name, :contact2_last_name, :contact2_title, :contact2_phone, :contact2_mobile, :contact2_email, :primary_contact, :hcs_intro_presenter, :hcs_sme, :hcs_current_carrier, :hcs_current_coverage_type, :hcs_renewal_month, :intelatek_bda, :intelatek_notes, :intelatek_day, :intelatek_timezone, :intelatek_time, :hcs_next_action, :hcs_next_action_date, :hcs_prospect, :cps_intro_presentation_date, :cps_sme_presentation_date, :cps_total_ap, :cps_status, :cps_agreement_date, :cps_supplier_match_meeting_date, :cps_intro_presenter, :cps_sme, :hcs_new_cost, :cps_next_action_date, :cps_next_action, :cps_prospect, :cps_converted_ap, :pay_prospect, :pay_hourly_employees, :pay_status, :pay_next_action_date, :pay_next_action, :pay_intro_presentation_date, :pay_intro_presenter, :pay_sme_presentation_date, :pay_sme, :pay_agreement_date, :pay_next_action_date, :pay_next_action_date)
    end

    def find_prospect
      @prospect = Prospect.find(params[:id])
    end

end