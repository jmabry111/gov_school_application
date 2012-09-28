class NotificationsMailer < ActionMailer::Base
  default :from => "application@pgsmst.com"

  def new_message(applicant)
    @applicant = applicant
    mail(:to => @applicant.school.representative_email, :subject => "Submitted Application")
  end

end
