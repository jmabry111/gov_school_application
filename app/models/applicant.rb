class Applicant < ActiveRecord::Base
  attr_accessible :address, :email, :english_teacher, :first_name, :gender, :grade, :home_phone, :last_name, 
    :math_teacher, :middle_name, :parent_first_name, :parent_last_name, :school, :science_teacher, :work_phone,
    :school_phone, :counselor_name, :due_to, :date_due
  
  before_save :strip_extra_characters
  
  validates :school, presence:true
  validates :first_name, presence:true, length: {maximum: 25}
  validates :last_name, presence:true, length: {maximum: 25}
  validates :grade, presence:true
  validates :parent_first_name, presence:true, length: {maximum: 25}
  validates :parent_last_name, presence:true, length: {maximum: 25}
  VALID_PHONE_REGEX = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  validates :home_phone, presence:true, format: {with:VALID_PHONE_REGEX}
  validates :work_phone, presence:true, format: {with:VALID_PHONE_REGEX}
 # validates :school_phone, presence:true, format: {with:VALID_PHONE_REGEX}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with:VALID_EMAIL_REGEX}, uniqueness: {case_sensitive:false}
  validates :math_teacher, presence:true, length: {maximum: 50}
  validates :science_teacher, presence:true, length: {maximum: 50}
  validates :english_teacher, presence:true, length: {maximum: 50}
  

  def strip_extra_characters
    self.home_phone = remove_non_digit_characters(home_phone)
    self.work_phone = remove_non_digit_characters(work_phone)
    self.school_phone = remove_non_digit_characters(school_phone)
  end

  private

  def remove_non_digit_characters(string)
    if string.present?
      string.gsub(/[^0-9]/, "")
    end
  end
end
