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

## usersテーブル

|Column|Type|Option|
|------|----|------|
|nickname|string|null: false|
|mail_address|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|second_name|string|null: false|
|first_name_kana|string|null: false|
|second_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone_number|string|null: false, unique: true|

### Association
- has_one :address
- has_many :user_evalution
- has_many :credit
- has_many :SNS_authentication
- has_many :favorite
- has_many :comment



## addressテーブル

|Column|Type|Option|
|------|----|------|
|first_name|string|null: false|
|second_name|string|null: false|
|first_name_kana|string|null: false|
|second_name_kana|string|null: false|
|post_number|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|
|user_id|references|null: false|

### Association
- belongs_to :user



## creditテーブル

|Column|Type|Option|
|------|----|------|
|card_number|string|null: false|
|security_code|integer|null: false|
|good_through_year|integer|null: false|
|good_through_year|integer|null: false|
|user_id|references|null: false|

### Association
- belongs_to :user



## SVS_authenticationテーブル

|Column|Type|Option|
|------|----|------|
|uid|integer|null: false|
|provider|string|null: false|
|user_id|references|null: false|

### Association
- belongs_to :user



## evaluationテーブル

|Column|Type|Option|
|------|----|------|
|value|integer||

### Association
- has_many :user_evaluation


## user_evaluationテーブル

|Column|Type|Option|
|------|----|------|
|evaluation_id|references|foreign_key :true|
|user_id|references|foreign_key :true|

### Association
- belongs_to :user
- belongs_to :evaluation



## itemsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|price|integer|null: false|
|condition|string|null: false|
|status|string|null: false|
|info|text|null: false|
|size|string|null: false|
|delivery_fee|integer|null: false|
|delivery_method|string|null: false|
|departure_area|string|null: false|
|departure_day|string|null: false|
|seller_id|references|null: false|
|buyer_id|references|null: false|
|category_id|references|null: false|
|brand_id|references|null: false|

### Association
- has_many :image
- has_many :favorite
- has_many :comment
- belongs_to :category
- belongs_to :brand


## categoryテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|

### Association
- has_many :items



## brandテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|

### Association
- has_many :items



## imageテーブル

|Column|Type|Option|
|------|----|------|
|image|string|null: false|
|item_id|references|foreign_key: true|

### Association
- belongs_to :items



## favoriteテーブル

|Column|Type|Option|
|------|----|------|
|favorite|string||
|item_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association
- belongs_to :items
- belongs_to :users


## commentテーブル

|Column|Type|Option|
|------|----|------|
|text|text|null: false|
|item_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association
- belongs_to :items
- belongs_to :users
