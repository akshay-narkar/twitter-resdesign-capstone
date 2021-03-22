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
end
