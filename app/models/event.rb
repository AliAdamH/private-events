class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendances

  validates :date, :time, :location, :description, :title, presence: true
  validate :date_cannot_be_in_the_past, :time_cannot_be_in_the_past
  validates :title, length: { in: 10..60 }
  validates :description, length: { maximum: 512 }

  scope :past, -> { where('date < ?', Date.today) }

  scope :upcoming, -> { where('date >= ?', Date.today) }

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, 'can\'t be in the past')
    end
  end

  def time_cannot_be_in_the_past
    if time.present? && time < Time.now
      errors.add(:time, 'can\'t be in the past')
    end
  end
end
