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

  # builds = Build.order(:finished_at).includes(:branches).limit(10)
  def show
    @user = User.find_by_id(params[:id])
    @tweet = @user.tweets.order(created_at: :desc)
    # y = @user.follows
    # y.each do |f|
    #   x+=User.find_by_id(f.id)
    # end
    @nonfollowing = User.all.order(created_at: :desc)
    @following = @user.follows
    @followers = @user.followers.includes(:followed)
  end

  private

  def params_new
    params.require(:@user123).permit(:username, :fullname, :photo, :coverimage)
  end
end

# @nonfollowing.each do |f|
#     if f.id != @user.id && @follows.not_nil?
#         @follows.each do |x|
#           if f.id == x.follows.id
#             break
#             flag=1
#           end
#         end

#     if flag=1
#        print f.fullname
#     else
#       flag=0
#     end

#   else
#     print f.fullname if f.id!=@user.id
#   end
# end
