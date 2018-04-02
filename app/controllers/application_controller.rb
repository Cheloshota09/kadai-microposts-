class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  def current_micropost
    return unless session[:micropost_id]
    @current_micropost ||= Micropost.find(session[:micropost_id])
  end
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_likes = user.likes.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end
end
