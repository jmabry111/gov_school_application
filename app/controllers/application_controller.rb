class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  private
  def after_sign_in_path_for(resource_or_scope)
    applicants_path
  end
  
  def after_sign_out_path_for(resource_or_pool)
    thank_you_path
  end
end
