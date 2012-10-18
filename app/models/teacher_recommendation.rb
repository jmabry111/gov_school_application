class TeacherRecommendation < ActiveRecord::Base
  attr_accessible :aptitude, :date_submitted, :dedication, :desire, :inquiry_skills, :interaction, 
        :persistence, :problem_solving, :recommendation, :self_discipline, :study_skills, :subject, 
        :teamwork, :time_management, :work_ethic, :applicant_id, :email, :teacher_name
  belongs_to :applicant
  before_save :create_slug
  
  def total_score
    total_score = aptitude + dedication + desire + inquiry_skills + interaction + persistence + 
                  problem_solving + recommendation + self_discipline + study_skills + teamwork + 
                  time_management + work_ethic
  end
  
  def to_param
    self.slug
  end
  
  private
  def create_slug
    self.slug = SecureRandom.hex(10)
  end

end
