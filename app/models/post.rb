class Post < ApplicationRecord
  belongs_to :author, :class_name => "User"
  has_rich_text :content
end
