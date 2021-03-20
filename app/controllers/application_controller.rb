class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    redirect_to new_session_path if session[:user_id].nil?
  end
end
