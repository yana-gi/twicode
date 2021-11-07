# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_required

  private

  def login_required
    redirect_to welcome_url unless current_user
  end
end
