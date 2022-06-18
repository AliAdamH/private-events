require 'rails_helper'

RSpec.describe "/events/index.html.erb", type: :view do
  let(:past_events) { Event.past }
  let(:upcoming_events) { Event.upcoming }


  before do
    assign(:past_events, past_events)
    assign(:upcoming_events, upcoming_events)
  end

  context 'When a user visits the index page' do
    it 'shows the upcoming events' do
      render
      expect(rendered).to have_content("Upcoming Events")
    end

    it 'shows the past events' do
      render
      expect(rendered).to have_content("Past Events")
    end

    it 'shows the title of events' do
      event = create(:event)
      render
      expect(rendered).to have_content(event.title)
    end
  end
end