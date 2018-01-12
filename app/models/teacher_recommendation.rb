class TeacherRecommendation < ActiveRecord::Base

  belongs_to :applicant
  before_save :create_slug
  
  validates :aptitude, presence:true
  validates :desire, presence:true
  validates :dedication, presence:true
  validates :inquiry_skills, presence:true
  validates :interaction, presence:true
  validates :persistence, presence:true
  validates :problem_solving, presence:true
  validates :recommendation, presence:true
  validates :self_discipline, presence:true
  validates :study_skills, presence:true
#  validates :teamwork, presence:true
  validates :time_management, presence:true
  validates :work_ethic, presence:true

  
  def total_score
      if self.aptitude != nil
      total_score = aptitude + dedication + desire + inquiry_skills + interaction + persistence + problem_solving + recommendation + self_discipline + study_skills + time_management + work_ethic
      end
  end
  
  def created?
    self.aptitude == nil
  end
  
  def complete?
    aptitude.present? && dedication.present? && desire.present?
  end
  
  def editable?
    !complete?
  end
  
  
  def to_param
    self.slug
  end

  def is_english?
    self.subject == "English"
  end

  private
  def create_slug
    if self.slug == nil
      self.slug = SecureRandom.hex(10)
    end
  end

end
