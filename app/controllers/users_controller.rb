class UsersController < ApplicationController
 
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :status => 201
    else
      render :status => 404
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete
      render :status => 204
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :user_image, :age, :bio, :eye_color, :height, :gender, :looking_for, :ethnicity, :zip_code, :location)
    end

end
