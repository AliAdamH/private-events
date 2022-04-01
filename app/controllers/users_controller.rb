class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.includes(:attended_events).find(current_user.id)
    @user_events = @user.created_events
  end
end