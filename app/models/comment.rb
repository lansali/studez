class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  delegate :username,
           :to => :user

  delegate :title,
           :username,
           :to => :post, :prefix => true

  scope :comments_by_user_for_post, lambda do |user_id, post_id|
    where(user_id: user_id, post_id: post_id)
  end
end
