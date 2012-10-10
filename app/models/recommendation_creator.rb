class RecommendationCreator
  
  def initialize(applicant)
    @applicant = applicant
  end
  
  def create_recommendations
    create_science_recommendation
    create_math_recommendation
    create_english_recommendation
  end
  
  private
  
  def create_science_recommendation
    teacher_recommendation = create_recommendation('science', @applicant.science_teacher_email)
    mail_recommendation(teacher_recommendation)
  end
  
  def create_math_recommendation
    teacher_recommendation = create_recommendation('math', @applicant.math_teacher_email)
    mail_recommendation(teacher_recommendation)
  end
  
  def create_english_recommendation
    teacher_recommendation = create_recommendation('english', @applicant.english_teacher_email)
    mail_recommendation(teacher_recommendation)
  end
  
  def mail_recommendation(teacher_recommendation)
    NotificationsMailer.invitations_message(teacher_recommendation).deliver
  end
  
  def create_recommendation(subject, email)
    teacher_recommendation = @applicant.teacher_recommendations.new(subject: subject, email: email)
    teacher_recommendation.save(validate: false) #I'm assuming you have validations that you want to require for the teacher but enforce them now
    teacher_recommendation #make sure we return the recommendation instead of the truth on saving
  end
  
end