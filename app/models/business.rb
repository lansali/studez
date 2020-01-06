class Business < ApplicationRecord
  belongs_to :employer
  has_many :opportunities, dependent: :destroy

  delegate :user_id,
           :username,
           :to => :employer
           
  scope :for_target_employer, lambda do |params|
    where(employer_id: params[:target_employer])
  end
  scope :top, lambda {|l| limit(l) }
end
