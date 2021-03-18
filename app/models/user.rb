class User < ApplicationRecord
  has_many :followers, foreign_key: 'follower_id', class_name: :Following
  has_many :followings, foreign_key: 'followed_id', class_name: :Following
  has_many :tweets, foreign_key: 'author_id', class_name: :Tweet

  validates :username, presence: { message: 'Needs to be present' },
                       uniqueness: { message: 'Username already taken. Please try a new one' },
                       length: { minimum: 3, message: 'Username should be atleast 3 characters long' }
end
