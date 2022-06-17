require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Associations' do
    it 'has a creator' do
      expect(described_class.reflect_on_association(:creator).macro).to eq(:belongs_to)
    end

    it 'is not valid without a creator' do
      event = build(:event, creator: nil)
      expect(event).not_to be_valid
    end

    it 'is valid when associated to a creator' do
      event = build(:event)
      expect(event).to be_valid
    end
  end

  context 'Validations' do
    it 'is not valid if all attributes are blank' do
      event = build(:event, :blank_invalid)
      expect(event).not_to be_valid
    end

    it 'is not valid if the specified date is in the past' do
      event = build(:event, date: 1.day.ago.to_date)
      expect(event).not_to be_valid
    end

    it 'is not valid if the time is in the past' do
      event = build(:event, date: Date.today, time: Time.now - 1.hour)
      expect(event).not_to be_valid
    end
  end
end
