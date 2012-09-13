class Applicant < ActiveRecord::Base
  attr_accessible :address, :email, :engteacher, :fname, :gender, :grade, :homephone, :lname, :mathteacher, :mname, :parentfname, :parentlname, :school, :scienceteacher, :workphone
end
