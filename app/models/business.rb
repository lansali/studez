class Business < ApplicationRecord
  belongs_to :employer
  has_many :opportunities, dependent: :destroy

  delegate :user_id,
           :username,
           :to => :employer

  scope :top, lambda {|l| limit(l) }

  def self.for_target_employer(params)
    where(employer_id: params[:target_employer])
  end
end
