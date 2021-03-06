class ApplicationController < ActionController::Base
  include SessionHelper
  include Pundit

  before_action :set_locale

  rescue_from Pundit::NotAuthorizedError,
              with: :user_not_authorized
  rescue_from ActionController::InvalidAuthenticityToken,
              with: :invalid_authenticity_token

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    # TODO: Регистрировать попытку несанкционированного доступа
    redirect_to root_path
  end

  def invalid_authenticity_token
    # TODO: Регистрировать попытку подмены CSRF - токена
    redirect_to root_path, flash: {notice: 'Can\'t verify CSRF token authenticity.'}
  end
end
