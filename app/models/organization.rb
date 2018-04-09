class Organization < ApplicationRecord
  resourcify

  validates :title,
            presence: true
  validates :description,
            presence: true
end
