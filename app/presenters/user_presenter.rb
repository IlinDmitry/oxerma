class UserPresenter < ApplicationPresenter
  include CarrierwavePresentable

  def full_name
    "#{model.last_name} #{model.first_name} #{model.middle_name}"
  end

  def short_name
    "#{model.last_name} #{model.first_name.try(:initial)}.#{model.middle_name.try(:initial)}."
  end
end