require 'rails_helper'

describe 'Tweet Building', type: :system do
  before(:all) do
    User.create(username: 'michaelj', fullname: 'Mike')
  end

  let(:username) { 'michaelj' }

  context 'Create a new tweet' do
    it 'they are on the timeline and create a tweet' do
      visit root_path

     fill_in '_userlogin_username', with: username

      click_button 'Login'

      fill_in '_tweet_text', with: 'Rspec test tweet'
      click_button 'Tweet'
      expect(page).to have_content('Rspec Test Tweet')
    end
  end
end
