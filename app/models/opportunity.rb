class Opportunity < ApplicationRecord
  belongs_to :business
  has_many :submissions, dependent: :destroy

  delegate :user_id,
           :username,
           :to => :business, :prefix => true

  def self.get_count_by_location(location)
    where(location: location).count
  end

  def self.get_distinct_locations
    select(:location).distinct.pluck(:location)
  end

  def self.get_distinct_categories
    select(:category).distinct.pluck(:category)
  end
end
