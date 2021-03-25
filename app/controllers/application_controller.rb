class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :already_loggedin


  private

  def require_login
    redirect_to new_session_path if session[:user_id].nil?
  end

  def already_loggedin
    redirect_to root_path if session[:user_id].present?
  end
end
