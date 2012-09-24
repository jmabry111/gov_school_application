class ApplicantsController < ApplicationController
  def new
    @applicant = Applicant.new
  end
  
  def create
    @applicant = Applicant.new(params[:applicant])
    
    respond_to do |format|
      if @applicant.save
        NotificationsMailer.new_message(@applicant).deliver
        flash[:success] = "Message was successfully sent."
        format.html { redirect_to @applicant, notice: 'Information was successfully submitted.' }
        format.json { render json: @applicant, status: :created, location: @applicant }
      else
        format.html { render action: "new" }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
  end
  
end
