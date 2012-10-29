class NotificationsMailer < ActionMailer::Base
  default :from => "application@pgsmst.com"

  def new_message(applicant)
    @applicant = applicant
    mail(:to => @applicant.school.user.email, :subject => "Submitted Application")
  end
  
  def invitations_message(teacher_recommendation)
    @teacher_recommendation = teacher_recommendation
    mail(:to => @teacher_recommendation.email, :subject => "Faculty Recommendation")
  end
end
