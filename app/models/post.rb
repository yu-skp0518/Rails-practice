class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, message: 'Too short to post!' }
  validates :body, presence: true, length: { maximum: 300, message: 'Too long to post!' }
end
