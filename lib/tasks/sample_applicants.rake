
namespace :db do
  desc "Add Sample Data"
  task populate: :environment do 
    require 'factory_girl_rails'             
    99.times do
      FactoryGirl.create(:full_applicant)
      FactoryGirl.create(:full_applicant_with_teacher_recommendations)
    end  
    #FactoryGirl.create(:teacher_recommendation)
  end
end