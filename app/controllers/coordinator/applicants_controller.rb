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
      redirect_to invite_teachers_coordinator_applicant_path(@applicant)
    else
      render 'edit'
    end
  end

  def invite_teachers
    @applicant = Applicant.find(params[:id])
  end

  def create_invitations
    @applicant = Applicant.find(params[:id])
    @applicant.update_attributes(params[:applicant])
    if has_all_teachers?
      #call your recommendation generator here
    else
      flash[:notice] = "You must provide an email address for all teachers!"
      redirect_to invite_teachers_coordinator_applicant_path(@applicant)
    end
  end

  def destroy
  end

  private

  def has_all_teachers?
    @applicant.science_teacher_email.present? && @applicant.math_teacher_email.present? && @applicant.english_teacher_email.present?
  end

end
