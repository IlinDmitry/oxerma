class ApplicationController < ActionController::Base
  include SessionHelper

  rescue_from ActionController::InvalidAuthenticityToken,
              with: :invalid_authenticity_token

  private

  def invalid_authenticity_token
    # TODO: Регистрировать попытку подмены CSRF - токена
    redirect_to root_path, notice: 'Can\'t verify CSRF token authenticity.'
  end
end
