class Coordinator::ApplicantsController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:new, :show, :create]

  def index
    if current_user.is_admin?
      @applicants = Applicant.paginate(page: params[:page])
    else
      #@applicants = Applicant.paginate(page: params[:page])
      @applicants = current_user.applicants.paginate(page: params[:page])
      #@applicants = Applicant.where(:school_id => current_user.schools.pluck(:id)).paginate(page: params[:page])
    end
  end

  def show
    @applicant = find_applicant_or_redirect
  end 

  def edit
    @applicant = find_applicant_or_redirect
  end

  def update
    @applicant = find_applicant_or_redirect
    if @applicant.update_attributes(params[:applicant])
      flash[:success] = "Section 2 Completed"
      redirect_to invite_teachers_coordinator_applicant_path(@applicant)
    else
      render 'edit'
    end
  end

  def invite_teachers
    @applicant = find_applicant_or_redirect
  end

  def create_invitations
    @applicant = find_applicant_or_redirect
    @applicant.update_attributes(params[:applicant])
    if has_all_teachers?
      #call your recommendation generator here
      RecommendationCreator.new(@applicant).create_recommendations
      flash[:success] = "Invitations successfully sent"
      redirect_to coordinator_applicants_path
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
