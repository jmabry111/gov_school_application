class Coordinator::TeacherRecommendations@applicant = Applicant.newController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:new, :show, :create, :edit, @thanks_path]

  def new
    @teacher_recommendation = TeacherRecommendation.new
  end

  def create
    @teacher_recommendation = TeacherRecommendation.new(params[:teacher_recommendation])
    if @teacher_recommendation.save
      redirect_to thanks_path
    else
      render 'new'
    end
  end
end