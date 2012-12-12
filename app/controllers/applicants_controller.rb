class ApplicantsController < ApplicationController
  
  skip_before_filter :authenticate_user!, :only => [:new, :create, @success_path]
  
  def new
    @applicant = Applicant.new
    @school = [School.list].flatten
  end

  def create
    @applicant = Applicant.new(params[:applicant])
    @school = [School.list].flatten
    
      if @applicant.save
        session[:current_applicant] = @applicant.id
        send_notifications
        redirect_to success_path, notice: 'Information was successfully submitted.'
      else
        render action: "new"
      end
  end
  
  def show
    @applicant = find_applicant_or_redirect
  end
  
  
  private
  def find_applicant_or_redirect
    applicant = Applicant.find_by_id(params[:id])
    unless applicant
     flash[:notice] = "This applicant does not exist"
     redirect_to coordinator_applicants_path
    end
    applicant
  end
  
  def send_notifications
    # Send notification to school rep
    NotificationsMailer.new_message(@applicant).deliver
    # Send notification to applicant(if email is provided)
    if @applicant.applicant_email.present?
      NotificationsMailer.confirmation_message(@applicant).deliver
    end
    # Send notification to applicant's parent(if email is provided)
    if @applicant.applicant_email.present?
      NotificationsMailer.parent_confirmation_message(@applicant).deliver
    end
  end
end
