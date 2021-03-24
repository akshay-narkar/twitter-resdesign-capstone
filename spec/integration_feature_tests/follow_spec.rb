require 'rails_helper'

describe 'Following action', type: :system do
  before(:all) do
    User.create(username: 'michaelj', fullname: 'Mike')
    User.create(username: 'jackson', fullname: 'Jack')  
end

    let(:username) { 'michaelj' }


  context 'Login as a new user & ' do
    it 'Follow the first user there succesfully' do
      visit root_path

     fill_in '_userlogin_username', with: username

      click_button 'Login'

      click_link 'Follow'

      expect(page).to have_content('Unfollow')
    end
  end
end
