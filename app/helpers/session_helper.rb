module SessionHelper
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find session[:user_id]
  end

  def user_authenticated?
    current_user
  end
end