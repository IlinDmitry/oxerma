require 'delegate'

class ApplicationPresenter < SimpleDelegator
  def date_created_at(format = '%Y-%m-%d')
    model.created_at.strftime format
  end

  def image_thumb_path
    model.image.thumb.url || default_image_path(self.class)
  end

  def image_thumb_small_path
    model.image.thumb_small.url || default_image_path(self.class)
  end

  def model
    __getobj__
  end

  private

  def default_image_path(context)
    context.to_s.sub!('Presenter', '').constantize::DEFAULT_IMAGE
  end
end
