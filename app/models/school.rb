class School < ActiveRecord::Base
  
  attr_accessible :name, :user_id
  has_many :applicants
  belongs_to :user

  validates :name, presence: true, length: {maximum: 50}
  validates :user, presence: true
  
  def self.list
    School.all(:select => :name).collect(&:name)
  end
  

end