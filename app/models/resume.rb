class Resume < ApplicationRecord
  belongs_to :student
  has_many :submissions, dependent: :destroy
end
