class SessionsController < ApplicationController

  def create
    if @user = User.find_by(name: params[:user][:name])
      session[:user_id] = @user.id
      redirect_to @user
    else
      '/signin'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
