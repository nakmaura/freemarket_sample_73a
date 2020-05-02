class Item < ApplicationRecord
  has_many :images,inverse_of: :item
  accepts_nested_attributes_for :images
end
