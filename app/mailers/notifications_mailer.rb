class NotificationsMailer < ActionMailer::Base
  default :from => "application@pgsmst.com"
  default :to => "jmabry@mymabry.com"

  def new_message(applicant)
    @applicant = applicant
    mail(:subject => "Submitted Application")
  end
end
