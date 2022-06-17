FactoryBot.define do
  factory :event_attendance do
    attended_event { create(:event) }
    attendee { create(:user) }
  end
end