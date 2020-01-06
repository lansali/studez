class Submission < ApplicationRecord
  belongs_to :opportunity
  belongs_to :student
  belongs_to :resume

  delegate :name,
           :location,
           :to => :opportunity, :prefix => true

  delegate :user_id,
           :to => :student, :prefix => true

  def self.for_target_student(params)
    where(student_id: params[:target_student]).paginate(page: params[:page], per_page: 7)
  end

  def self.for_target_job(params)
    where(opportunity_id: params[:target_job]).paginate(page: params[:page], per_page: 7)
  end
end
