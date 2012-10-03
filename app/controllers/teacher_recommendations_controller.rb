class TeacherRecommendationsController < ApplicationController
 
  def new
    @teacher_recommendation = TeacherRecommendation.new
  end
  
  def create
    @teacher_recommendation = TeacherRecommendation.new(params[:teacher_recommendation])
    if @teacher_recommendation.save
      redirect_to @teacher_recommendation
    else
      render 'new'
    end
  end
  
  
end
