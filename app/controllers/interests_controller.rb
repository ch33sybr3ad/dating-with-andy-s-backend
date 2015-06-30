class InterestsController < ApplicationController

  def index
    render json: User.find(params[:user_id]).interests
  end

  def create
    @interest = Interest.find_or_create_by(interest_params)
    if @interest.save
      UserInterest.create(user_id:params[:user_id], interest_id: @interest.id)
      render :status => 201
    else
      render :status => 404
    end
  end

  def destroy
    @interest = Interest.find(params[:id])
    if @interest.delete
      render :status => 204
    end
  end

  private

    def interest_params
      params.require(:interest).permit(:name)
    end

end