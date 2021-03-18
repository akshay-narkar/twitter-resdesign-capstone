require 'rails_helper'

describe Post, type: :model do
  let(:user1) { User.create(email: 'michaelbublay@gmail.com', password: 'password', password_confirmation: 'password', name: 'Mike') }
  subject { Post.new(user: user1, content: 'xyz') }

  context 'Associations' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should belong_to(:user) }
  end

  context 'Validations' do
    it { should validate_presence_of(:content) }
    it {
      should validate_length_of(:content)
        .is_at_most(1000)
        .with_message('1000 characters in post is the maximum allowed.')
    }
  end

  context 'Relations' do
    it 'Post creator id that is the user who creates post is equal to user id' do
      expect(subject.user).to eq(user1)
    end
  end
end
