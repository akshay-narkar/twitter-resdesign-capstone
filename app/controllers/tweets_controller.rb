class TweetsController < ApplicationController
  def new
    return unless session[:user_id].present? && User.first?

    @user = User.find_by_id(session[:user_id])
    @following = @user.follows.pluck(:followed_id)
    @tweets = Tweet.all.order(created_at: :desc).includes(:author)
    @users = User.all.order(created_at: :desc)
  end

  def create
    @user = User.find_by_id(session[:user_id])
    @tweet = @user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to user_path(@user.id), method: :show, notice: 'Tweet successfully created'
    else
      redirect_to new_tweet_path, notice: 'Failed to create tweet. Try again'
    end
  end

  private

  def tweet_params
    params.require(:@tweet).permit(:text)
  end
end
