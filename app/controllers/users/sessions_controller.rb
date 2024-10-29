class Users::SessionsController < Devise::SessionsController
  def create
    super do |user|
      if user.admin?
        redirect_to admin_dashboard_path and return
      else
        redirect_to user_dashboard_path and return
      end
    end
  end
end
