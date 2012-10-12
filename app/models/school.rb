class School < ActiveRecord::Base
  
  attr_accessible :name, :representative_email
  has_many :applicants
  has_one :user

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :representative_email, presence: true, format: {with:VALID_EMAIL_REGEX}
  
  def self.list
    School.all(:select => :name).collect(&:name)
  end
  

end