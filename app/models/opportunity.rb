class Opportunity < ApplicationRecord
  belongs_to :business
  has_many :submissions, dependent: :destroy

  delegate :user_id,
           :username,
           :to => :business, :prefix => true
end
