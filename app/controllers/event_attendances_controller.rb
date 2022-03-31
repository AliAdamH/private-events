class EventAttendancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @event_attendance = current_user.event_attendances.build
  end

  def create
    @event_attendance = current_user.event_attendances.build(event_attendance_params)
  end

  private

  def event_attendance_params
    params.require(:event_attendance).permit(:attended_event_id)
  end
end