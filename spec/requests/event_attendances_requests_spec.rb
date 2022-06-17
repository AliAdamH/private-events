require 'rails_helper'

RSpec.describe "EventAttendances", type: :request do

  before do
    user = create(:user)
    sign_in user
  end

  describe "POST /eventattendances" do
    it 'creates an event attendance' do
      event_id = create(:event).id
      post event_attendances_path(attended_event_id: event_id)
      expect(response.status).to eq 302
    end
  end

  describe "DELETE /eventattendances" do
    it 'removes an event attendance' do
      event_attendance = create(:event_attendance)
      delete event_attendance_path(id: event_attendance.id)
      expect(response.status).to eq 302
    end
  end
end