class Coordinator::TeacherInvitationsController < ApplicationController
  
  def new
    @applicant = Applicant.find(params[:id])
  end
  
  def show
    @applicant = Applicant.find(params[:id])
  end
  
  def create
    @applicant = Applicant.find(params[:id])
    if @applicant.save?
      flash[:success] = "Invitations sent"
      redirect_to @applicant
    else
      render 'new'
    end
  end
  
  def update
    @applicant = Applicant.find(params[:id])
     if @applicant.update_attributes(params[:applicant])
       flash[:success] = "Section 2 Completed"
       redirect_to new_coordinator_teacher_invitation_path(:id => @applicant.id)
     else
       render 'edit'
     end
   end
   
end
