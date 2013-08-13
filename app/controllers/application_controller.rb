class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_admin?
    if current_user && current_user.admin?
      true
    else
      redirect_to root_path, flash: { alert: "You're not allowed" }
    end
  end
end
