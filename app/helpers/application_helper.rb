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
    elsif diff[:hours] >= 1
      "#{diff[:day]} Hours ago"
    else
      "#{diff[:minutes]} Minutes ago"
    end
  end
end
