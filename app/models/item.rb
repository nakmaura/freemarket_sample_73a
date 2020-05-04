class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images,allow_destroy: true

  # belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  # belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name,presence: true, length: {maximum: 40}
  validates :introduction,presence: true, length: {maximum: 1000}
  validates :price, presence: true,inclusion: {in: 300..9999999}
  validates :introduction,presence: true, length: {maximum: 1000}
  validates :prefecture,presence: true

end