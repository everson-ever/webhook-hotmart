class HomeController < ApplicationController

  def index
    return render json: { status: true, message: "application is online in #{Time.now}" }
  end

end
