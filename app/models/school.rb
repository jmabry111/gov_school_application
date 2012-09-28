class School < ActiveRecord::Base
  
  attr_accessible :name, :representative_email

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :representative_email, presence: true, format: {with:VALID_EMAIL_REGEX}
  
  def self.list
#    ["Bassett High School", "Magna Vista High School","Martinsville High School",
#			"George Washington High School","Galileo High School", "Chatham High School",
#			"Dan River High School", "Gretna High School","Tunstall High School"]
    School.all(:select => :name).collect(&:name)
  end
end