require 'rails_helper'

describe Following, type: :model do
  let(:user1) { User.create(username: 'michael', fullname: 'Mike Angelo') }
  let(:user2) { User.create(username: 'jackson', fullname: 'Mike Jackson') }
  subject { Following.new(follower: user1, followed: user2) }

  context 'Associations' do
    it { should belong_to(:follower), class_name: :User }
    it { should belong_to(:followed), class_name: :User }
  end

  context 'Validations' do
    it { should validate_uniqueness_of(:follower_id).scoped_to(:followed_id) }
  end

  context 'Relations' do
    it 'User 1 sends the friend request' do
      expect(subject.followed).to eq(user2)
    end
    it 'User 2 is the friend who receives the request' do
      expect(subject.follower).to eq(user1)
    end
  end
end
