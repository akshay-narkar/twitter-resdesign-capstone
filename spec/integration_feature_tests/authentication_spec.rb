require 'rails_helper'

describe 'Session authentication', type: :system do
  before(:all) do
    User.create(username: 'michaelj', fullname: 'Mike')
  end

  let(:username) { 'michaelj' }

  context 'Login as a new user' do
    it 'they are on login page and try to login in and succeeds' do
      visit root_path

      fill_in '_userlogin_username', with: username

      click_button 'Login'

      expect(page).to have_content('Mike')
    end
  end
end
