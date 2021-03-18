class TweetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by_id(session[:user_id])
    @tweet = @user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to root_path, notice: 'Tweet successfully created'
    else
      redirect_to new_tweet_path, notice: 'Failed to create tweet. Try again'
    end
  end

  private

  def tweet_params
    params.require(:@tweet).permit(:text)
  end
end
