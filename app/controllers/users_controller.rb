class UsersController < ApplicationController
  before_action :allow_cross_domain
 
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user.id, status: 201
    else
      render json: @user.errors.full_messages, status: 404
    end
  end

  def login
    @user = User.where(email: user_params['email']).first
    if @user.password == user_params['password']
      render json: @user.id
    else
      render json: @user.errors.full_messages, status: 404
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete
      render json: "user was successfully deleted", status: 204
    end
  end

  def search
    users = User.all
    @object = {}
    users.each do |user|
      @object[:"#{user.username}"] = { user: user, interests: user.interests}
    end
    render json: @object
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: 200
    else
      render json: @user.errors.full_messages, status: 404
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :user_image, :age, :bio, :eye_color, :height, :gender, :looking_for, :ethnicity, :zip_code, :location)
    end

end
