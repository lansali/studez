class Resume < ApplicationRecord
  belongs_to :student
  has_many :submissions, dependent: :destroy

  validates :full_name, presence: true
  validates :phone_number, presence: true
  validates :email_address, presence: true
  validates :work_experience, presence: true
  validates :education, presence: true

  delegate :username,
           :to => :student, :prefix => true

  def self.for_student(id)
    where(student_id: id)
  end
end
