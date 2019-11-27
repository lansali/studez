class User < ApplicationRecord
  has_secure_password
  has_many :authored_opportunities, :class_name => 'Opportunity', :foreign_key => 'author_id'
  has_many :authored_posts, :class_name => 'Post', :foreign_key => 'author_id'

  validates :email, presence: true, uniqueness: true
end
