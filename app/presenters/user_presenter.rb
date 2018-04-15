class UserPresenter < ApplicationPresenter
  def full_name
    "#{model.last_name} #{model.first_name} #{model.middle_name}"
  end

  def short_name
    "#{model.last_name} #{model.first_name.initial}. #{model.middle_name.initial}."
  end
end