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
end