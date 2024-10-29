class DashboardController < ApplicationController
  before_action :authenticate_user!

  def admin
    redirect_to root_path unless current_user.admin?
    # Admin-specific dashboard logic
  end

  def user
    redirect_to root_path if current_user.admin?
    # User-specific dashboard logic
  end
end
