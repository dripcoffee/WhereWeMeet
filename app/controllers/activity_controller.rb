class ActivityController < ApplicationController
  def list
  end

  def new
  end

  def add
    @activity = Activity.new
    @activity.name = params[:name]
    @activity.user = @user.id
  end
end
