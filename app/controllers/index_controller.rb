class IndexController < ApplicationController
  def index
    if cookies[:name] != nil
      # should redirect to activity page
      redirect_to action: "list", controller: "activity",status: :found
    end

    @activities = Activity.where({status: 0}).order("id DESC")
  end

  def about
  end
end
