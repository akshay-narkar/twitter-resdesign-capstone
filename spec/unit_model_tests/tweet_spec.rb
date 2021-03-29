require 'rails_helper'

describe Tweet, type: :model do
  let(:user1) { User.create(username: 'michael', fullname: 'Mike Angelo') }
  subject { Tweet.new(author: user1, text: 'This is a tweet') }

  context 'Associations' do
    it { should belong_to(:author), class_name: :User }
  end

  context 'Validations' do
    it { should validate_presence_of(:text).with_message('Tweet cant be blank') }
    it {
      should validate_length_of(:text)
        .is_at_most(280)
        .with_message('Tweet limit is 280 characters')
    }
  end

  context 'Relations' do
    it 'Tweet creator id that is the user who creates post is equal to user id' do
      expect(subject.author).to eq(user1)
    end
  end
end
