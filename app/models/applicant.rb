class Applicant < ActiveRecord::Base
  attr_accessible :address, :email, :engteacher, :fname, :gender, :grade, :homephone, :lname, :mathteacher, :mname, :parentfname, :parentlname, :school, :scienceteacher, :workphone
  
  validates :school, presence:true
  validates :fname, presence:true, length: {maximum: 25}
  validates :lname, presence:true, length: {maximum: 25}
  validates :grade, presence:true
  validates :parentfname, presence:true, length: {maximum: 25}
  validates :parentlname, presence:true, length: {maximum: 25}
  VALID_PHONE_REGEX = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  validates :homephone, presence:true, format: {with:VALID_PHONE_REGEX}
  validates :workphone, presence:true, format: {with:VALID_PHONE_REGEX}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with:VALID_EMAIL_REGEX}, uniqueness: {case_sensitive:false}
  validates :mathteacher, presence:true, length: {maximum: 50}
  validates :scienceteacher, presence:true, length: {maximum: 50}
  validates :engteacher, presence:true, length: {maximum: 50}
end
