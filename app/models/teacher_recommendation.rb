class TeacherRecommendation < ActiveRecord::Base
  attr_accessible :aptitude, :date_submitted, :dedication, :desire, :inquiry_skills, :interaction, 
        :persistence, :problem_solving, :recommendation, :self_discipline, :study_skills, :subject, 
        :teamwork, :time_management, :work_ethic, :applicant_id, :email
  belongs_to :applicant
  
end
