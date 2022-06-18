
RSpec.describe "users/show.html.erb", type: :view do
  let(:user) { create(:user) }
  let(:user_events) { user.created_events }
  before do
    sign_in user
    assign(:user, user)
    assign(:user_events, user_events)
  end
  context 'When a user visits his profile page' do
    it 'Shows his created events' do
      event = create(:event, creator: user)
      render
      expect(rendered).to have_content('Created Events')
      expect(rendered).to have_content(event.title)
    end

    it 'Shows his attended events' do
      event = create(:event)
      event.attendees << user
      render
      expect(rendered).to have_content('Future Events')
      expect(rendered).to have_content(event.title)
    end
  end
end