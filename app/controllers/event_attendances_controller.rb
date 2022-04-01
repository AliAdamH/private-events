class EventAttendancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @event_attendance = EventAttendance.new
  end

  def create
    event = Event.find(params[:attended_event_id])
    @event_attendance = EventAttendance.new(
      attendee_id: current_user.id,
      attended_event_id: event.id
    )
    if @event_attendance.save
      flash[:notice] = "Sucessfully Attended"
      redirect_to event_path(event)
    else
      flash.now[:alert] = 'Woo Something bad Happened.'
      render event_path(event)
    end
  end


  def destroy
    @event_attendance = EventAttendance.find(params[:id])
    @event_attendance.destroy
    flash[:notice] = 'You have successfully unattended the event'
    redirect_back fallback_location: root_path
  end

  private

  def event_attendance_params
    params.permit(:attended_event_id)
  end
end