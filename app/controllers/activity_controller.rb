class ActivityController < ApplicationController
  def list
    user_name = cookies[:name]
    users = User.where("name='#{user_name}'")
    if users.empty?
      redirect_to action: "index", controller: "index"
    else
      @user = users[0]
      @activities = Activity.where({user: @user.id, status: 0}).order("id DESC")
    end
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

  def get_by_id
    id = params[:id]
    @activity = Activity.where({id: id, status: 0}).order("id DESC").last!

    render "activity/get_by_id"
  end

  def get_by_user
    users = User.where("name='#{params[:name]}'")
    if users.empty?
      redirect_to action: "index", controller: "index"
    else
      @user = users[0]
      @activities = Activity.where({user: @user.id, status: 0}).order("id DESC")
      render "activity/get_by_user"
    end
  end
end
