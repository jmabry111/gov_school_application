class SchoolsController < ApplicationController
  def new
    @school = School.new
  end
  
  def create
    @school = School.new(params[:school])
    if @school.save
      redirect_to @school
    else
      render 'new'
    end
  end
  
  def show
    @school = School.find(params[:id])
  end
end
