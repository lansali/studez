class Opportunity < ApplicationRecord
  belongs_to :business
  has_many :submissions, dependent: :destroy

  delegate :user_id,
           :username,
           :to => :business, :prefix => true
    
  scope :get_distinct_locations, select(:location).distinct.pluck(:location)
  scope :get_distinct_categories, select(:category).distinct.pluck(:category)

  def self.get_count_by_location(location)
    where(location: location).count
  end
end
