class Post < ApplicationRecord
  belongs_to :author, :class_name => "User"
  has_rich_text :content
  has_many :comments, dependent: :destroy
end
