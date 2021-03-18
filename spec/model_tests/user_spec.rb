require 'rails_helper'

describe User, type: :model do
  context 'Associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:friendships) }
    it { should have_many(:requests_received), foreign_key: :friend_id, class_name: :Friendship }
    it { should have_many(:requests_sent), foreign_key: :user_id, class_name: :Friendship }
  end

  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it {
      should validate_length_of(:name).is_at_most(20)
    }
  end
end
