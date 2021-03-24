class User < ApplicationRecord
  has_many :followers, foreign_key: 'followed_id', class_name: :Following, dependent: :destroy
  has_many :follows, foreign_key: 'follower_id', class_name: :Following, dependent: :destroy
  has_many :tweets, foreign_key: 'author_id', class_name: :Tweet, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  has_one_attached :coverimage, dependent: :destroy
  validates :username, presence: { message: 'Username needs to be present' },
                       uniqueness: { message: 'Username already taken. Please try a new one' },
                       length: { minimum: 3, message: 'Username should be atleast 3 characters long' }
  validates :fullname, presence: { message: 'Fullname needs to be present' },
                       length: { minimum: 3, message: 'Fullname should be atleast 3 characters long' }

  validates :photo, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                    size: { less_than: 500.kilobytes, message: 'Profile Picture size needs to be lesser than 500 kbs' }
  validates :coverimage,  content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                         size: { less_than: 500.kilobytes, message: 'Coverimage size needs to be lesser than 500 kbs' }
end
