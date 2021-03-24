require 'rails_helper'

describe 'Authorization', type: :system do
  context 'Create a New user ' do
    it 'Creates a new user and goes to timeline' do
      visit new_user_path

      fill_in '_user123_username', with: 'Mike'
      fill_in '_user123_fullname', with: 'Mickey Jackson'

      click_button 'Sign Up'
      expect(page).to have_content('Successfully created your account')
    end
  end
end
