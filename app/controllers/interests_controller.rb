class InterestsController < ApplicationController

  def index
    render json: User.find(params[:user_id]).interests
  end

end