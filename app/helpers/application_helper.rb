module ApplicationHelper
  def checklogin
    if session[:user_id].present?
      render 'layouts/template'

    else
      render 'layouts/notloggedintemplate'
    end
  end

  def notice1
    if notice
      render 'layouts/notice'
    elsif alert
      render 'layouts/alert'
    end
  end

  def checkiffollowed(tweet, following)
    return unless following.include?(tweet.author_id)

    diff = Time.diff(tweet.created_at, Time.now)
    diff1 = timedifference(diff)

    render partial: 'tweets/followertweets', locals: { tweet: tweet, diff: diff1 }
  end

  def checkiffollowing(user, following)
    return if following.include?(user.id) || user.id == @user.id

    render partial: 'tweets/whotofollow', locals: { notfollower: user }
  end

  def followorunfollow
    follarray = @followers.pluck(:follower_id)
    return unless @profile != @user

    if follarray.include?(@user.id)
      link_to 'Unfollow', following_path(follower_id: session[:user_id], followed_id: @profile.id), method: :delete, class: 'btn btn-danger'

    else
      link_to 'Follow', followings_path(follower_id: session[:user_id], followed_id: @profile.id), method: :create, class: 'btn btn-primary'

    end
  end

  def followorunfollow1(follower)
    viewerfol = @user.follows.pluck(:followed_id)

    return if follower.id == session[:user_id]

    if viewerfol.include?(follower.id)
      link_to 'Unfollow', following_path(follower_id: session[:user_id], followed_id: follower.id), method: :delete, class: 'btn btn-danger'

    else
      link_to 'Follow', followings_path(follower_id: session[:user_id], followed_id: follower.id), method: :create, class: 'btn btn-primary'

    end
  end

  def timedifference(diff)
    if diff[:year] > 1
      "#{diff[:year]} Years ago"
    elsif diff[:month] > 1
      "#{diff[:month]} months ago"
    elsif diff[:week] > 1
      "#{diff[:week]} weeks ago"
    elsif diff[:day] > 1
      "#{diff[:day]} days ago"
    elsif diff[:day] == 1
      "#{diff[:day]} day ago"
    elsif diff[:hour] > 1
      "#{diff[:hour]} Hours ago"
    else
      "#{diff[:minute]} Minutes ago"
    end
  end

  def userphoto(user)
    if user.photo.attached?
      image_tag user.photo, class: 'img-thumbnail', style: 'width: 75px; height: 75px'

    else
      image_tag('https://res.cloudinary.com/akshayn/image/upload/v1616597161/icon_efjywz.jpg', size: '75x75', class: 'img-thumbnail')
    end
  end

  def followerphoto(notfollower)
    if notfollower.photo.attached?
      image_tag notfollower.photo, class: 'rounded-circle', style: 'width: 65px; height: 65px'

    else
      image_tag('https://res.cloudinary.com/akshayn/image/upload/v1616597161/icon_efjywz.jpg', size: '65x65', class: 'rounded-circle')
    end
  end

  def followerphoto1(notfollower)
    if notfollower.photo.attached?
      image_tag notfollower.photo, class: 'rounded-circle', style: 'width: 100px; height: 100px'

    else
      image_tag('https://res.cloudinary.com/akshayn/image/upload/v1616597161/icon_efjywz.jpg', size: '100x100', class: 'rounded-circle')
    end
  end

  def followerprofilephoto(notfollower)
    if notfollower.photo.attached?
      image_tag notfollower.photo, class: 'rounded-circle', style: 'width: 80px; height: 80px'

    else
      image_tag('https://res.cloudinary.com/akshayn/image/upload/v1616597161/icon_efjywz.jpg', size: '80x80', class: 'rounded-circle')
    end
  end

  def coverphoto(profile)
    if profile.coverimage.attached?
      image_tag profile.photo, width: '100%', height: '300px'

    else
      image_tag('https://res.cloudinary.com/akshayn/image/upload/v1616597161/cover_pb3dek.jpg', width: '100%', height: '300px')
    end
  end
end
