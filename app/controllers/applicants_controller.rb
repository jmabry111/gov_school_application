class ApplicantsController < ApplicationController
  
  skip_before_filter :authenticate_user!, :only => [:new, :create, @success_path]
  
  def new
    @applicant = Applicant.new
    @school = [School.list].flatten
  end

  def create
    @applicant = Applicant.new(params[:applicant])
    @school = [School.list].flatten
    
    respond_to do |format|
      if @applicant.save
        NotificationsMailer.new_message(@applicant).deliver
        format.html { redirect_to success_path, notice: 'Information was successfully submitted.' }
        format.json { render json: @applicant, status: :created, location: @applicant }
      else
        format.html { render action: "new" }
        #format.json { render json: @applicant.errors, status: :unprocessable_entity }
       #render 'new'
      end
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
end
