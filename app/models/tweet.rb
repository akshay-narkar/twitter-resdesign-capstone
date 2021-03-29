class Tweet < ApplicationRecord
  belongs_to :author, class_name: :User
  validates :text, presence: { message: 'Tweet cant be blank' },
                   length: { maximum: 280, message: 'Tweet limit is 280 characters' }
end
