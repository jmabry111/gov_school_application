class ApplicantsController < ApplicationController
  def new
    @applicant = Applicant.new
  end
  
  def create
    @applicant = Applicant.new(params[:applicant])
    if @applicant.save
      redirect_to new_applicant_path
    end
  end
  
  def destroy
  end
  
end
