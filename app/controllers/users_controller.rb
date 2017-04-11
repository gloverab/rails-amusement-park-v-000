class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    # binding.pry
  end

  def new
    @user = User.new
    # binding.pry
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      "something"
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :nausea, :happiness, :height, :tickets, :admin)
  end
end
