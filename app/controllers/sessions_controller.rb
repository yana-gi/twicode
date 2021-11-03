# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(auth_params)
    if user
      log_in(user)
      flash[:notice] = 'ログインしました'
    else
      flash[:notice] = '失敗しました'
    end
    redirect_to root_path
  end

  def destroy
    log_out if logged_in?
    flash[:notice] = 'ログアウトしました'
    redirect_to root_path
  end

  def failure
    flash[:notice] = 'キャンセルしました'
    redirect_to root_path
  end

  private
  def auth_params
    request.env['omniauth.auth']
  end
end
