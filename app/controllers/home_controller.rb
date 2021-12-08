# frozen_string_literal: true

class HomeController < ApplicationController
  def top
    @code = current_user.code.order(created_at: 'DESC').page params[:page]
  end
end
