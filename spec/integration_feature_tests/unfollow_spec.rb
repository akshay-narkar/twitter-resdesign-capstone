require 'rails_helper'

describe 'UnFollowing action', type: :system do
  before(:all) do
    User.create(username: 'michaelj', fullname: 'Mike')
    User.create(username: 'jackson', fullname: 'Jack')
  end

  let(:username) { 'michaelj' }

  context 'Login as a new user & ' do
    it 'Follow the first user there succesfully and then unfollow as well' do
      visit root_path

      fill_in '_userlogin_username', with: username

      click_button 'Login'

      click_link 'Follow'

      click_link 'Unfollow'

      expect(page).to have_content('Follow')
    end
  end
end
