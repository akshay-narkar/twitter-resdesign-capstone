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

  def userphoto(_user)
    if @user.photo.attached?
      image_tag @user.photo, class: 'img-thumbnail', style: 'width: 75px; height: 75px'

    else
      image_tag('icon.jpeg', size: '75x75', class: 'img-thumbnail')
    end
  end

  def followerphoto(notfollower)
    if notfollower.photo.attached?
      image_tag notfollower.photo, class: 'rounded-circle', style: 'width: 65px; height: 65px'

    else
      image_tag('icon.jpeg', size: '65x65', class: 'rounded-circle')
    end
  end
end
