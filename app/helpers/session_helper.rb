module SessionHelper
  def current_user
    return unless session[:user_id]
    @current_user ||= begin
        User.find session[:user_id]
      rescue ActiveRecord::RecordNotFound
        nil
      end
  end

  def user_authenticated?; current_user; end

  def require_authentication
    unless user_authenticated?
      redirect_to root_path, notice: 'Please sign in or register'
    end
  end

  def not_require_authentication
    if user_authenticated?
      redirect_to root_path, notice: 'Please sign out on your account'
    end
  end
end