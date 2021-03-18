require 'rails_helper'

describe Friendship, type: :model do
  let(:user1) { User.create(email: 'cristiano@gmail.com', password: 'password', password_confirmation: 'password', name: 'cris') }
  let(:user2) { User.create(email: 'leomessi@gmail.com', password: 'password', password_confirmation: 'password', name: 'messi') }
  subject { Friendship.new(user: user1, friend: user2, status: false) }

  context 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:friend), class_name: :User }
  end

  context 'Validations' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:friend_id).case_insensitive }
    it { should validate_uniqueness_of(:friend_id).scoped_to(:user_id).case_insensitive }
  end

  context 'Relations' do
    it 'User 1 sends the friend request' do
      expect(subject.user).to eq(user1)
    end
    it 'User 2 is the friend who receives the request' do
      expect(subject.friend).to eq(user2)
    end
  end
end
