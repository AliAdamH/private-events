require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Associations' do
    it 'Can create many events' do
      expect(described_class.reflect_on_association(:created_events).macro).to eq(:has_many)
    end

    it 'Can attend many events' do
      expect(described_class.reflect_on_association(:attended_events).macro).to eq(:has_many)
    end
  end

  context 'Validations' do
    it 'has a valid factory' do
      expect(create(:user)).to be_valid
    end
  end


  describe '.past' do
    it 'includes events created in the past' do
      event = Event.new(attributes_for(:event).merge(date: 1.day.ago.to_date))
      # skip validations to create an event in the past.
      event.save(validate: false)
      expect(Event.past).to include(event)
    end
  end

  describe '.upcoming' do
    it 'includes events where Date >= Today' do
      event = create(:event)
      expect(Event.upcoming).to include(event)
    end
  end 
end