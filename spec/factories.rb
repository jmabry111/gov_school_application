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
