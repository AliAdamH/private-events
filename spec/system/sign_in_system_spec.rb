RSpec.describe "User sign-in", type: :system do

  context 'when user credentials are invalid' do
    it 'shows Invalid credentials alert' do
      visit root_path
      click_link 'Login'
      fill_in 'user_email', with: 'somefakemail@mail.com'
      fill_in 'user_password', with: "fakepwd"
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end


  context 'when the user credentials are valid' do
    it 'redirects to root path' do
      user = create(:user)
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'

      expect(page).to have_current_path(root_path)
      expect(page).to have_link('New Event')
    end
  end
end