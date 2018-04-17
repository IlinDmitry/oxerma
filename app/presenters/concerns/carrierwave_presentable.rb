module CarrierwavePresentable
  extend ActiveSupport::Concern

  included do
    def image_thumb_path
      model.image.thumb.url || default_image_path
    end

    def image_thumb_small_path
      model.image.thumb_small.url || default_image_path
    end

    private

    def default_image_path
      'default.png'
    end
  end
end