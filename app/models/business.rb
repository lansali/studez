class Business < ApplicationRecord
  belongs_to :employer
  has_many :opportunities, dependent: :destroy

  delegate :user_id,
           :username,
           :to => :employer

  def self.for_target_employer(params)
    where(employer_id: params[:target_employer]).paginate(page: params[:page], per_page: 7)
  end
end
