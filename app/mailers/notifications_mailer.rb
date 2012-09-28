class NotificationsMailer < ActionMailer::Base
  default :from => "application@pgsmst.com"

  def new_message(applicant)
    @applicant = applicant
    mail(:to => @school_email, :subject => "Submitted Application")
  end

end
