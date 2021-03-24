class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    if session[:user_id].nil?
      @user = User.new(params_new)
      if @user.save
        redirect_to root_path, notice: 'Successfully created your account'
      else
        redirect_to new_user_path, notice: 'Failed to create account. Try again'
      end
    else
      redirect_to root_path, alert: 'Your are already logged in'
    end
  end

  def show
    @user = User.find_by_id(session[:user_id])
    @profile = User.find_by_id(params[:id])
    @tweets = @profile.tweets.order(created_at: :desc)
    @followers = @profile.followers.includes(:follower).limit(5)
  end

  private

  def params_new
    params.require(:@user123).permit(:username, :fullname, :photo, :coverimage)
  end
end
