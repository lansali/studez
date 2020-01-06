class Business < ApplicationRecord
  belongs_to :employer
  has_many :opportunities, dependent: :destroy

  delegate :user_id,
           :username,
           :to => :employer
end
