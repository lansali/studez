class User < ApplicationRecord
  has_secure_password
  store_accessor :settings, :privacy

  has_many :authored_posts, :class_name => 'Post', :foreign_key => 'author_id', dependent: :destroy
  has_one :student, dependent: :destroy
  has_one :employer, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :privacy, presence: true
  validates :privacy, inclusion: { in: %w(y n) }

  def self.is_public
    where("settings @> hstore(?, ?)",'privacy','n')
  end
end
