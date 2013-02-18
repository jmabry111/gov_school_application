
namespace :db do
  desc "Add Sample Data"
  task populate: :environment do 
    require 'factory_girl_rails'             
    99.times do
      FactoryGirl.create(:full_applicant)
    end 
    297.times do
      FactoryGirl.create(:teacher_recommendation)
    end   
  end
end