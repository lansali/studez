class Opportunity < ApplicationRecord
  belongs_to :business
  has_many :submissions, dependent: :destroy
end
