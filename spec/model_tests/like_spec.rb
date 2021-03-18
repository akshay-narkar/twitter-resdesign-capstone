require 'rails_helper'

describe Like, type: :model do
  let(:user) { User.create(email: 'michaelbublay@gmail.com', password: 'password', password_confirmation: 'password', name: 'Mike') }
  let(:post) { Post.create(user: user, content: 'xyz') }
  subject { Like.new(post: post, user: user) }

  context 'Associations' do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

  context 'Validations' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:post_id) }
  end

  context 'Relations' do
    it 'Like creator id that is the user who likes a post is equal to user id' do
      expect(subject.user).to eq(user)
      expect(subject.post).to eq(post)
    end
  end
end
