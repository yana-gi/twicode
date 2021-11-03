# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    session[:uid] = user.uid
  end

  def current_user
    if session[:uid]
      @current_user ||= User.find_by(uid: session[:uid])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:uid)
    @current_user = nil
  end
end
