class SessionsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    unless session[:user_id].nil? 
      redirect_to root_path, alert: 'Your are already logged in'
    else
    @user = User.find_by_username(params_login[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'You have successfully logged in'
    else
      redirect_to new_session_path, notice: 'Invalid Username'
    end
  end
  end

  def show; end

  def index; end

  def destroy
    reset_session
    redirect_to root_path, alert: 'Successfully Logged Out'
  end

  private

  def params_login
    params.require(:@userlogin).permit(:username)
  end
end
