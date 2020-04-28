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
|name|string|null: false|
|introduction|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|price|integer|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|

### Association
- has_many :item_images
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_one :user_evaluation
- has_many :favorites
- has_many :comments

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

##categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items
- has_ancestry

##usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true, index: true|
|password|string|null: false|
|re_password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_date|date|null: false|

### Association
- has_many :credit_cards
- has_many:user_evaluations
- has_one :destination
- has_one :sale
- has_one :point
- has_many :todo_lists
- has_many :notices
- has_many :favorites, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :comments

##credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false|unique: true|
|customer_id|string|null: false|unique: true|
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
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
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


##articlesテーブル
|Column|Type|Options|
|------|----|-------|
|news|text|null: false|


