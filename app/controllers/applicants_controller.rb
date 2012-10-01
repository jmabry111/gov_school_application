class ApplicantsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:new, :show]
  
  def index
    @applicants = Applicant.paginate(page: params[:page])
  end
  
  def new
    @applicant = Applicant.new
    @school = [School.list].flatten
  end
  
  def show
    @applicant = Applicant.find(params[:id])
  end
  
  def create
    @applicant = Applicant.new(params[:applicant])
    @school = [School.list].flatten
    
    respond_to do |format|
      if @applicant.save
        NotificationsMailer.new_message(@applicant).deliver
        format.html { redirect_to @applicant, notice: 'Information was successfully submitted.' }
        format.json { render json: @applicant, status: :created, location: @applicant }
      else
        format.html { render action: "new" }
        #format.json { render json: @applicant.errors, status: :unprocessable_entity }
       #render 'new'
      end
    end
  end
  
  def edit
    @applicant = Applicant.find(params[:id])
  end
  
  def update
    @applicant = Applicant.find(params[:id])
     if @applicant.update_attributes(params[:applicant])
       flash[:success] = "Section 2 Completed"
       redirect_to @applicant
     else
       render 'edit'
     end
   end
  
  def destroy
  end

end
