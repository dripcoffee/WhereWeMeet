class IndexController < ApplicationController
  def index
    if cookies[:name] != nil
      # should redirect to activity page
      redirect_to action: "info", controller: "user",status: :found
    end
  end

  def about
  end
end
