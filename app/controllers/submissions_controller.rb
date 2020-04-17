require "ostruct"

class SubmissionsController < ApplicationController
  include SubmissionsHelper
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  def index
    if params[:target_student].present?
      @submissions = Submission.for_target_student(params)
    elsif params[:target_job].present?
      @submissions = Submission.for_target_job(params)
    else
      @submissions = Submission.paginate(page: params[:page], per_page: 7)
    end
  end

  def show
  end

  def new
    @opportunity_id = params[:opportunity_id]
    @erroed_resume_object = nil
    @resume_id = nil
    @resume_id = Resume.where(student_id: current_student.id).first.id unless lacks_resume?(current_student.id)
    @submission = Submission.new
  end

  def edit
  end

  def create
    bool_flag = params[:submission][:resume_form] == true.to_s
    result = save_associated_resume(resume_params) if bool_flag 
    @submission = Submission.new(submission_params)
    @submission.resume_id = result.resume.id if bool_flag

    respond_to do |format|
      if bool_flag && result.has_errors
        render_errored_result(result, format)
      else
        if @submission.save
          format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
          format.json { render :show, status: :created, location: @submission }
        else
          format.html { render :new }
          format.json { render json: @submission.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url(target_student: current_student.id), notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def render_errored_result(result, format)
    @resume_id = nil
    @erroed_resume_object = result.resume
    @opportunity_id = params[:submission][:opportunity_id]
    format.html { render :new }
    format.json { render json: @submission.errors, status: :unprocessable_entity }
  end

  private
    def set_submission
      @submission = Submission.find(params[:id])
    end

    def submission_params
      params.require(:submission).permit(:opportunity_id, :resume_id, :cover_letter).merge({:student_id => current_student.id})
    end

    def resume_params
      params.require(:resume).permit(:profile_picture, :full_name, :tagline, :phone_number, :physical_address, :email_address, :work_experience, :education, :certifications, :skills, :languages, :past_projects, :workshops, :volunteerships, :relevant_links, :extra_columns).merge({:student_id => current_student.id})
    end
end
