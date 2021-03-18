class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_new)

    if @user.save
      redirect_to root_path, notice: 'Successfully created your account'
    #   redirect_to user_path(@user[:id]), notice: 'Successfully created your account. Login to create event'
    else
      redirect_to new_user_path, notice: 'Failed to create account. Try again'
    end
  end

  def show
    @user = User.find(params[:id])
    # @events = @user.attendances.all
    # @eventcreate = @user.events.all
  end

  private

  def params_new
    params.require(:@user123).permit(:username, :fullname, :photo, :coverimage)
  end
end
