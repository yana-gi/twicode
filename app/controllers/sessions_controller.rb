# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user_data = request.env['omniauth.auth']
    session[:nickname] = user_data[:info][:nickname]
    redirect_to root_path, notice: 'ログインしました'
  end
end
