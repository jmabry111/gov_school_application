FactoryGirl.define do
  sequence (:phone) do |n|
    "222-111-#{n}"
  end  
  sequence (:applicant) do |n|
    "#{n}"
  end
end

FactoryGirl.define do
  factory :applicant do
    first_name "Peter"
    last_name "Parker"
    grade 12
    parent_first_name "Aunt"
    parent_last_name "Mae"
    home_phone "222-333-3333"
    work_phone "222-111-1111"
    email "spiderman@example.com"
    math_teacher "Teacher 1"
    science_teacher "Teacher 2"
    english_teacher "Teacher 3"
  end
end

FactoryGirl.define do
  factory :teacher_recommendation do
     aptitude {3}
     date_submitted {Time.now}
     dedication {3}
     desire {3}
     inquiry_skills {3}
     interaction {3}
     persistence {3}
     problem_solving {3}
     recommendation {3}
     self_discipline {3}
     study_skills {3}
     subject {3}
     teamwork {3}
     time_management {3}
     work_ethic {3}
     teacher_name {Applicant.all.sample.science_teacher || Applicant.all.sample.math_teacher || Applicant.all.sample.english_teacher}
     last_notified_at {Time.now} 
  end
  
  factory :full_applicant, parent: :applicant do
    school {School.all.sample}
    first_name {Faker::Name.first_name}
    middle_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    grade {11}
    email {Faker::Internet.email}
    gender  {"Male"}
    parent_first_name {Faker::Name.first_name}
    parent_last_name {Faker::Name.last_name}
    address {Faker::Address.street_name}
    city {Faker::Address.city}
    state {Faker::Address.state}
    zip {Faker::Address.zip_code}
    home_phone {"5555551212"}
    work_phone {"5555551212"}
    math_teacher {Faker::Name.name}
    science_teacher {Faker::Name.name}
    english_teacher {Faker::Name.name}
    applicant_confirmation {true}
    parent_confirmation {true}
    teacher_contacted {true}
    applicant_email {Faker::Internet.email}
    is_archived false
    school_phone {"5555551212"}
    gpa {3.8}
    date_due {Time.now + 2.weeks}
    
    factory :full_applicant_with_teacher_recommendations do
      ignore do
        teacher_recommendations_count 3
      end
      

    end
  end
end