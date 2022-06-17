require 'rails_helper'

RSpec.describe "Events", type: :request do

  before do
    user = create(:user)
    sign_in user
  end

  describe "POST /events" do
    it 'creates the event' do
      event_params = attributes_for(:event)
      post events_path({event: event_params})
      expect(response.status).to eq(302)
    end

    context 'The attributes are invalid' do
      xit 'responds with a 422' do
        event_params = attributes_for(:event, :blank_invalid)
        post events_path({event: event_params})
        expect(response.status).to eq(422)
      end
    end
  end

  describe "GET /events" do
    it 'returns the index page' do
      get events_path
      expect(response).to render_template(:index)
    end
  end
end