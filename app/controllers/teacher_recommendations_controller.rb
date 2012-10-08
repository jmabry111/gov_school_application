class TeacherRecommendationsController < ApplicationController
  
  skip_before_filter :authenticate_user!, :only => [:show, :edit, @thanks_path]
   
  def edit
    @teacher_recommendation = TeacherRecommendation.find(params[:id])
  end
  
  def update
    @teacher_recommendation = TeacherRecommendation.find(parms[:id])
    if @teacher_recommendation.update_attributes(parms[:teacher_recommendation])
      flash[:success] = "Recommendation Submitted"
      redirect_to thanks_path
    else
      render 'edit'
    end
  end
  
  
end
