class Api::V1::HomeController < ApplicationController

  def index
    return render json: { status: true, message: "application is online in #{Time.now}" }
  end

end
