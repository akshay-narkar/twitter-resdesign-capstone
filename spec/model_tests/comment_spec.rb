require 'rails_helper'

describe Comment, type: :model do
  let(:user) { User.create(email: 'michaelbublay@gmail.com', password: 'password', password_confirmation: 'password', name: 'Mike') }
  let(:post) { Post.create(user: user, content: 'xyz') }
  subject { Comment.new(post: post, user: user, content: 'Random Comment') }

  context 'Associations' do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

  context 'Validations' do
    it {
      should validate_length_of(:content)
        .is_at_most(200)
        .with_message('200 characters in comment is the maximum allowed.')
    }
  end

  context 'Relations' do
    it 'Comment creator id that is the user who comments on a post is equal to user id' do
      expect(subject.user).to eq(user)
      expect(subject.post).to eq(post)
    end
  end
end
