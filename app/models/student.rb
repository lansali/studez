class Student < ApplicationRecord
  belongs_to :user
  has_many :submissions, dependent: :destroy
  has_one :resume, dependent: :destroy
end
