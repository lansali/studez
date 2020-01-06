class Submission < ApplicationRecord
  belongs_to :opportunity
  belongs_to :student
  belongs_to :resume

  delegate :name,
           :location,
           :to => :opportunity, :prefix => true

  delegate :user_id,
           :to => :student, :prefix => true
end
