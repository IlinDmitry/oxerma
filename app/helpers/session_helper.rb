module SessionHelper
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find session[:user_id]
  end

  def authenticated_user?; current_user; end

  def require_authentication
    unless authenticated_user?
      redirect_to root_path, notice: 'Please sign in or register'
    end
  end

  def not_require_authentication
    if authenticated_user?
      redirect_to root_path, notice: 'Please sign out on your account'
    end
  end
end