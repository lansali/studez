class Employer < ApplicationRecord
  belongs_to :user
  has_many :businesses, dependent: :destroy

  delegate :username,
           :to => :user
end
