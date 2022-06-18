require 'rails_helper'

RSpec.describe "events/show.html.erb", type: :view do

  describe "Unauthenticated user" do
    context "When a visitor looks up the details page of an event" do
      it 'Does not show the attend button' do
        event = create(:event)
        assign(:event, event)
        render
        expect(rendered).not_to have_button('Attend')
      end
    end
  end

  describe "Authenticated user" do

    before do
      user = create(:user)
      sign_in user
    end

    context "When a logged in user looks up the details page of an event" do
      it 'shows the attend button' do
        event = create(:event)
        assign(:event, event)
        render
        expect(rendered).to have_button('Attend')
      end
    end
  end
end