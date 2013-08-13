class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_admin?
    redirect_to root_path, flash: { alert: "You're not allowed" } unless user_is_admin?
  end

  def user_is_admin?
    user_signed_in? && current_user.admin?
  end

  helper_method :user_is_admin?
end
