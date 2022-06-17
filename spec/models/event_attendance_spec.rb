require 'rails_helper'

RSpec.describe EventAttendance, type: :model do
  it 'has a valid factory' do
    event_attendance = create(:event_attendance)
    expect(event_attendance).to be_valid
  end
end