class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images,allow_destroy: true

  belongs_to :seller, class_name: "User",optional: true
  belongs_to :buyer, class_name: "User",optional: true
  belongs_to :category

  validates :images, presence: true
  validates :name,presence: true, length: {maximum: 40}
  validates :introduction,presence: true, length: {maximum: 1000}
  validates :price, presence: true,inclusion: {in: 300..9999999}
  validates :prefecture_name,presence: true
  validates :condition_id,presence: true
  validates :postage_payer,presence: true
  validates :preparation_day,presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  enum condition_id: { "新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6}, _prefix: true
  enum postage_payer: { "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}, _prefix: true
  enum preparation_day: { "1~2日で発送": 1, "着払い（購入者負担）": 2, "4~7日で発送": 3}, _prefix: true

end