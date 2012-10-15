class User < ActiveRecord::Base
  attr_accessible :school_id, :encrypted_password, :reset_password_token, 
                  :reset_password_sent_at, :reset_password_sent_at, :reset_password_sent_at, 
                  :reset_password_sent_at, :reset_password_sent_at, :remember_created_at, 
                  :remember_created_at, :remember_created_at, :remember_created_at, 
                  :remember_created_at, :current_sign_in_at, :current_sign_in_at, :current_sign_in_at, 
                  :current_sign_in_at, :current_sign_in_at, :last_sign_in_at, :last_sign_in_at, 
                  :last_sign_in_at, :last_sign_in_at, :last_sign_in_at, :current_sign_in_ip, 
                  :last_sign_in_ip, :admin
  
  belongs_to :school
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  after_create { |user| user.send_reset_password_instructions }
  def password_required?
    new_record? ? false : super
  end
  
  def is_admin?
    self.admin
  end
end
