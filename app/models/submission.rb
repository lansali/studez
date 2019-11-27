class Submission < ApplicationRecord
  belongs_to :opportunity
  belongs_to :student
end
