module Imagenable
  extend ActiveSupport::Concern

  included do
    mount_uploader :image, ImageUploader

    validates :image,
              file_size: {less_than: 512.kilobytes}
  end
end