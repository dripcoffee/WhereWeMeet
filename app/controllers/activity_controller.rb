class ActivityController < ApplicationController
  def list
    user_name = cookies[:name]
    users = User.where("name='#{user_name}'")
    @user = users[0]
    @activities = Activity.where({user: @user.id, status: 0}).order("id DESC")
  end

  def new
    require "time"
    examples_pool = ["Lunch in Baidu", "Kicking shuttlecock"]
    @example_activity = examples_pool.at(Time.now.to_i % examples_pool.size)
  end

  def add
    user_name = cookies[:name]
    users = User.where("name='#{user_name}'")
    @user = users[0]

    @activity = Activity.new
    @activity.name = params[:name]
    @activity.content = params[:content]
    @activity.user = @user.id
    @activity.group = 1
    @activity.status = 0
    @activity.save

    redirect_to action: "list", controller: "activity"
  end
end
