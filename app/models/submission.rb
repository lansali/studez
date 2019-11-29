class Submission < ApplicationRecord
  belongs_to :opportunity
  belongs_to :student
  has_one_attached :cv
  has_one_attached :cover_letter
end
