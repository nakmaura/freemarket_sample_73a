# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

##itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_img_id|references|null: false, foreign_key: true|
|name|string|null: false|
|introduction|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|item_condition_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|postage_payer_id|references|null: false, foreign_key: true|
|postage_type_id|references|null: false, foreign_key: true|
|preparation_day_id|references|null: false, foreign_key: true|
|price|integer|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|

### Association
- has_many :item_images
- belongs_to :user
- belongs_to :category
- belongs_to :bland
- belongs_to :size
- belongs_to :item_condition
- belongs_to :postage_payer
- belongs_to :postage_type
- belongs_to :preparation_day
- belongs_to :user_evaluation
- has_many :favorites
- has_many :users,  through:  :favorites
- has_many :comments
- has_many  :users,  through:  :comments


##item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|reference|null: false, foreign_key: true|
|url|string|null:false|

### Association
- belongs_to :item

##brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

##sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

### Association
- has_many :items

##item_conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|item_condition|string|null: false|

### Association
- has_many :items

##postage_payersテーブル
|Column|Type|Options|
|------|----|-------|
|postage_payer|string|null: false|

### Association
- has_many :items

##postage_typesテーブル
|Column|Type|Options|
|------|----|-------|
|postage_type|string|null: false|

### Association
- has_many :items

##preparation_daysテーブル
|Column|Type|Options|
|------|----|-------|
|preparation_day|string|null: false|

### Association
- has_many :items

##categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|strig|null: false|

### Association
- has_many :items

##usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true, index: true|
|password|string|null: false|
|repassword|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|

### Association
- has_many :items
- belongs_to :credit_card
- has_many:user_evaluations
- belongs_to :destination
- belongs_to :sale
- belongs_to :point
- has_many :todo_lists
- has_many :notices

has_many :favorites, dependent: :destroy
has_many :items, dependent: :destroy
has_many :favorited_items, through: :favorites, source: :item

- has_many :comments
- has_many :items
- has_many :commented_items, through: :comments, source: :item

##credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

##commentsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|comment|text|null: false|
|created_at|timestamp|null: false|

### Association
- belongs_to :user
- belongs_to :item


##favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


##evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|string|null: false|

### Association
- has_many :user_evaluations


##user_evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|evaluation_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :evaluation
- belongs_to :item

##destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_last_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_last_name_kana|string|null: false|
|post_code|integer(7)|null:false|
|prefecture_code|integer|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building_name|string||
|phone_number	|integer|unique: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

##salesテーブル
|Column|Type|Options|
|------|----|-------|
|sale|integer||
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user

##pointsテーブル
|Column|Type|Options|
|------|----|-------|
|point|integer||
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user

##todo_listsテーブル
|Column|Type|Options|
|------|----|-------|
|list|text|null:false|
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user

##noticesテーブル
|Column|Type|Options|
|------|----|-------|
|notice|text|null:false|
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user


##newssテーブル
|Column|Type|Options|
|------|----|-------|
|news|text|null: false|

