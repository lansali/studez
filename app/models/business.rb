class Business < ApplicationRecord
  belongs_to :employer
  has_many :opportunities, dependent: :destroy
end
