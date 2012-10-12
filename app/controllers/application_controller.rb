class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :authenticate_user!
  
  def authenticate_admin!
    redirect_to new_user_session_path unless current_user.is_admin?
  end
  
  
  private
  def after_sign_in_path_for(resource_or_scope)
    coordinator_applicants_path
  end
  
  def after_sign_out_path_for(resource_or_pool)
    thank_you_path
  end
end
