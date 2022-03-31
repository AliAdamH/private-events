class EventAttendancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @event_attendance = EventAttendance.new
  end

  def create
    @event_attendance = EventAttendance.new(event_attendance_params, attendee_id: current_user.id)
    if @event_attendance.save
      flash[:notice] = "Sucessfully Attended"
      redirect_to event_url(@event_attendance.attended_event)
    else
      flash.now[:alert] = 'Woo Something bad Happened.'
      render event_path(@event_attendance.attended_event)
    end
  end


  def destroy
    @event_attendance = EventAttendance.find_by(
      attended_event_id: event_attendance_params,
      attendee_id: current_user.id
    )
    @event_attendance.destroy
    flash[:notice] = 'You have successfully unattended the event'
    redirect_to events_path
  end

  private

  def event_attendance_params
    params.permit(:attended_event_id)
  end
end