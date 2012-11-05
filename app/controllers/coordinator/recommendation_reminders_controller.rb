class Coordinator::RecommendationRemindersController < ApplicationController
  
  def new
  end
  
  def create
    logger.info params
    @recommendation_reminder = TeacherRecommendation.find_by_slug!(params[:teacher_recommendation_id])
    NotificationsMailer.reminder_message(@recommendation_reminder).deliver
    flash[:success] = "Reminder successfully sent"
    redirect_to coordinator_applicant_path(@recommendation_reminder.applicant.id)
  end
  
end
