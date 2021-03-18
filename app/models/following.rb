class Following < ApplicationRecord
  belongs_to :follower, class_name: :User
  belongs_to :followed, class_name: :User
  validates_uniqueness_of :follower, scope: %i[followed]
end
