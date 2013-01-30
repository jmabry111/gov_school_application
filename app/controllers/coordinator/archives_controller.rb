class Coordinator::ArchivesController < ApplicationController
  
  def index
    if current_user.is_admin?
      @applicants = Applicant.paginate(page: params[:page]).where(:is_archived => true)
      @applicant_years = @applicants.group_by {|y| y.created_at.beginning_of_year}
    else
      @applicants = current_user.applicants.paginate(page: params[:page]).where(:is_archived => true)
      @applicant_years = @applicants.group_by {|y| y.created_at.beginning_of_year}
    end
  end
  
  
end
