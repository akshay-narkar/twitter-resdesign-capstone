class FollowingsController < ApplicationController
  skip_before_action :already_loggedin
  def new; end

  def index
    return unless session[:user_id].present? && User.first.present?

    @user = User.find_by_id(session[:user_id])
    @following = @user.follows.pluck(:followed_id)
    @followings = @user.follows.includes(:followed)
    @users = User.all.order(created_at: :desc)
  end

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
      redirect_to user_path(delete_params[:followed_id]), notice: 'Unfollowed'
    else
      redirect_to user_path(delete_params[:followed_id]), alert: 'Failed to Unfollow'
    end
  end

  private

  def follow_params
    params.permit(:followed_id, :follower_id)
  end

  def delete_params
    params.permit(:followed_id, :follower_id)
  end
end
