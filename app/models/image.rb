class Image < ApplicationRecord
  belongs_to :item
  mount_uploaders :url, ImageUploader
  validates :url, presence: true
end