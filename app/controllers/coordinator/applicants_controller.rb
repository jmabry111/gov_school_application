class Coordinator::ApplicantsController < ApplicationController
  
  skip_before_filter :authenticate_user!, :only => [:new, :show, :create]
  
  def index
    @applicants = Applicant.paginate(page: params[:page])
  end
   
  def show
    @applicant = Applicant.find(params[:id])
  end 
  
  def edit
    @applicant = Applicant.find(params[:id])
  end
  
  def update
    @applicant = Applicant.find(params[:id])
     if @applicant.update_attributes(params[:applicant])
       flash[:success] = "Section 2 Completed"
       redirect_to teachers_path
     else
       render 'edit'
     end
   end
   
   def teacher_invite
     @applicant = Applicant.find(params[:id])
   end

  def destroy
  end
  
end
