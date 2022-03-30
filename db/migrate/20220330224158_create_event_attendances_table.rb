class CreateEventAttendancesTable < ActiveRecord::Migration[6.1]
  def change
    create_table 'event_attendances', id: false do |t|
      t.integer :attendee_id, foreign_key: true
      t.integer :attended_event_id, foreign_key: true
    end
  end
end
