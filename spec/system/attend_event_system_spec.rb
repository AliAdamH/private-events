RSpec.describe "Event Attendance", type: :system do
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  context 'When a user clicks to attend an event' do
    it 'adds him to the attendees list' do
      event = create(:event)
      visit event_path(event)
      click_button 'Attend'

      expect(page).to have_content('Sucessfully Attended')
      expect(page).to have_content(user.email)
      expect(event.attendees).to include(user)
    end
  end


  context 'A user can cancel his attendance' do
    it 'removes him from the attendees list' do
      event = create(:event)
      event.attendees << user
      expect(event.attendees).to include(user)

      visit event_path(event)
      click_link 'Unattend'
      expect(page).to have_content('You have successfully unattended the event')
      expect(user.attended_events).not_to include(event)
    end
  end
end


