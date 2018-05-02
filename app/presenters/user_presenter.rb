class UserPresenter < ApplicationPresenter

  def full_name
    "#{model.last_name} #{model.first_name}"
  end

  def short_name
    "#{model.last_name} #{model.first_name.try(:initial)}."
  end
end