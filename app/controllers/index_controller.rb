class IndexController < ApplicationController
  def index
    if cookies[:name] != nil
      # should redirect to activity page
      redirect_to action: "list", controller: "activity",status: :found
    else
      @activities = Activity.where({status: 0}).order("id DESC")
      render layout: "welcome"
    end
  end

  def about
  end
end
