class FollowingsController < ApplicationController
  def new; end

  def create
    @follow = Following.new(follow_params)

    if @follow.save
      redirect_to root_path, notice: 'Followed successfully'
    else
      redirect_to new_tweet_path, notice: 'Failed to follow'
    end
  end

  private

  def follow_params
    params.permit(:followed_id, :follower_id)
  end
end
