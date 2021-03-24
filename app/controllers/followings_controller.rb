class FollowingsController < ApplicationController
  def new; end

  def create
    @follow = Following.new(follow_params)

    if @follow.save
      redirect_to user_path(follow_params[:followed_id]), notice: 'Followed successfully'
    else
      redirect_to user_path(follow_params[:followed_id]), alert: 'Failed to follow'
    end
  end

  def destroy
    delete = Following.find_by(followed_id: params[:followed_id], follower_id: params[:follower_id])
    if delete.destroy
      # user = User.find_by_id(session[:user_id])
      redirect_to user_path(delete_params[:followed_id]), notice: 'Unfollowed'
      # redirect_to friendship_path(current_user.id), method: :get, notice: 'Unfollowed'
    else
      redirect_to user_path(delete_params[:followed_id]), alert: 'Failed to Unfollow'

      # redirect_to friendship_path(current_user.id), method: :get, notice: 'Failed to unfollow. Please try again'
    end
  end


  # def show 
  #   @user = User.find_by_id(session[:user_id])
  #   # @profile = User.find_by_id(params[:id])
  #   @following = @user.follows.includes(:followed)
  #   @follower = @user.followers.includes(:follower)
  # end


  private

  def follow_params
    params.permit(:followed_id, :follower_id)
  end

  def delete_params
    params.permit(:followed_id, :follower_id)
  end
end
