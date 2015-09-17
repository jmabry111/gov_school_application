class Coordinator::RecommendationRemindersController < ApplicationController

  def teacher_recommendation_params
    params.require(:teacher_recommendation).permit(:aptitude, :date_submitted, :dedication, :desire, :inquiry_skills, :interaction, :persistence, :problem_solving, :recommendation, :self_discipline, :study_skills, :subject, :teamwork, :time_management, :work_ethic, :applicant_id, :email, :teacher_name, :last_notified_at)
  end

  def create
    @teacher_recommendation = TeacherRecommendation.find_by_slug!(params[:teacher_recommendation_id])
    @teacher_recommendation.update_attribute(:last_notified_at, Time.now)
    NotificationsMailer.reminder_message(@teacher_recommendation).deliver
    flash[:success] = "Reminder successfully sent"
    redirect_to coordinator_applicant_path(@teacher_recommendation.applicant.id)
  end
  
  def update
    @teacher_recommendation = TeacherRecommendation.find_by_slug!(params[:teacher_recommendation_id])
    @teacher_recommendation.update_attribute(:teacher_name, (params[:teacher_recommendation][:teacher_name]))
    @teacher_recommendation.update_attribute(:email, (params[:teacher_recommendation][:email]))
    @teacher_recommendation.update_attribute(:last_notified_at, Time.now)
    NotificationsMailer.reminder_message(@teacher_recommendation).deliver
    flash[:success] = "Information updated and reminder successfully sent"
    redirect_to coordinator_applicant_path(@teacher_recommendation.applicant.id)
  end
end
