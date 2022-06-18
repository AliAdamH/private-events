RSpec.describe "Event Creation", type: :system do

  before do
    user = create(:user)
    sign_in user
  end


  context 'When a user creates an event' do
    it 'is rendered after creation' do
        example_title = "Title for an event"
        example_description = "An Interesting description"
        example_location = "An Interesting location"
        example_date = (Date.today + 1)
        example_time = Time.now + 1.hour

        visit new_event_path
        fill_in 'event_title', with: example_title  
        fill_in 'event_description', with: example_description  
        fill_in 'event_location', with: example_location  
        select example_date.year, from: 'event_date_1i'
        select example_date.strftime('%B'), from: 'event_date_2i'
        select example_date.day, from: 'event_date_3i'
        select example_time.hour, from: 'event_time_4i'
        select example_time.min, from: 'event_time_5i'

        click_button 'Create'
        expect(page).to have_content('Attendees List')
    end
  end
end