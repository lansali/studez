class User < ApplicationRecord
  extend UserAssociatedLifecycle

  has_secure_password
  store_accessor :settings, :privacy, :account_type

  has_many :authored_posts, :class_name => 'Post', :foreign_key => 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :student, dependent: :destroy
  has_one :employer, dependent: :destroy
  has_one :resume, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :privacy, presence: true
  validates :privacy, inclusion: { in: %w(y n) }
  validates :account_type, presence: true
  validates :account_type, inclusion: { in: %w(admin moderator business student) }

  after_create :save_associatied_account(self.settings[:account_type], self.id)

  scope :is_public, where("settings @> hstore(?, ?)",'privacy','n')
end
