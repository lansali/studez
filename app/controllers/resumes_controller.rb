class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  def index
    if params[:my_resume].present? && params[:my_resume] == 'retrieve_resumes'
      @resumes = Resume.for_student(current_student.id).paginate(page: params[:page], per_page: 7)
    else
      @resumes = Resume.paginate(page: params[:page], per_page: 7)
    end
  end

  def show
  end

  def new
    @resume = Resume.new
  end

  def edit
  end

  def create
    @resume = Resume.new(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Resume was successfully created.' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_resume
      @resume = Resume.find(params[:id])
    end

    def resume_params
      params.require(:resume).permit(:profile_picture, :full_name, :tagline, :phone_number, :physical_address, :email_address, :work_experience, :education, :certifications, :skills, :languages, :past_projects, :workshops, :volunteerships, :relevant_links, :extra_columns).merge({:student_id => current_student.id})
    end
end
