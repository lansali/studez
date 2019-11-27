class Business < ApplicationRecord
  belongs_to :employer
  has_many :opportunities
end
