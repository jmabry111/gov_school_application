namespace :db do
  desc "Add Sample Applicants"
  task populate: :environment do
    Applicant.create!(first_name: "Bruce",
                 middle_name: "B",
                 last_name: "Wayne",
                 grade: 11,
                 gender: "Male",
                 parent_first_name: "Bat",
                 parent_last_name: "Wayne",
                 address: "123 Bat Lane",
                 city: "Nocturnal",
                 state: "VA",
                 zip: "12345",
                 home_phone: "5555551234",
                 work_phone: "5555551212",
                 email: "bat@batman.com",
                 math_teacher: "Count Dracula",
                 science_teacher: "Wonder Woman",
                 english_teacher: "Cat Woman",
                 applicant_confirmation: true,
                 parent_confirmation: true,
                 teacher_contacted: true,
                 applicant_email: "batman@example.com",
                 is_archived: false)
    99.times do |n|
      applicant.school = School.all.sample
      first_name = Faker::Name.first_name
      middle_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      grade = 11..12
      email = "example-#{n+1}@example.org"
      gender =  "Male"
      parent_first_name = Faker::Name.first_name
      parent_last_name = Faker::Name.last_name
      address = Faker::Address.street_name
      city = Faker::Address.city
      state = Faker::Address.state
      zip = Faker::Address.zip_code
      home_phone = Faker::PhoneNumber.phone_number
      work_phone = Faker::PhoneNumber.cell_phone
      math_teacher = Faker::Name.name
      science_teacher = Faker::Name.name
      english_teacher = Faker::Name.name
      applicant_confirmation = true
      parent_confirmation = true
      teacher_contacted = true
      applicant_email = Faker::Internet.email
      is_archived = false
      Applicant.create!(applicant.school => School.all.sample,
                   first_name: first_name,
                   middle_name: middle_name,
                   last_name: last_name,
                   grade: grade,
                   gender: gender,
                   parent_first_name: parent_first_name,
                   parent_last_name: parent_last_name,
                   address: address,
                   city: city,
                   state: state,
                   zip: zip,
                   home_phone: home_phone,
                   work_phone: work_phone,
                   email: email,
                   math_teacher: math_teacher,
                   science_teacher: science_teacher,
                   english_teacher: english_teacher,
                   applicant_confirmation: applicant_confirmation,
                   parent_confirmation: parent_confirmation,
                   teacher_contacted: teacher_contacted,
                   applicant_email: applicant_email,
                   is_archived: is_archived)
    end
  end
end