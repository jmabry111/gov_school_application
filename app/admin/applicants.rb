ActiveAdmin.register Applicant do
  permit_params :address, :email, :english_teacher, :first_name, :gender, :grade, :home_phone, :last_name, :math_teacher, :middle_name, :parent_first_name, :parent_last_name, :school_id, :science_teacher, :work_phone, :school_phone, :counselor_name, :due_to, :date_due, :english_teacher_email, :science_teacher_email, :math_teacher_email, :applicant_confirmation, :parent_confirmation, :applicant_email, :city, :state, :zip, :gpa, :teacher_contacted, :is_archived, :school  
end
