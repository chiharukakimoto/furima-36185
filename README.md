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

## userテーブル
|Column            |Type  |Options    |
|nickname          |string|null: false|
|email             |string|null: false|
|encrypted_password|string|null: false|
|family_name       |string|null: false|
|first_name        |string|null: false|
|family_name_kana  |string|null: false|
|first_name_kana   |string|null: false|
|birth_day         |data  |null: false|

has_one :card
has_one :order
has_many :items

## itemテーブル
|Column       |Type   |Options                       |
|name         |string |null: false                   |
|item_info    |string |null: false                   |
|category     |string |null: false                   |
|status       |string |null: false                   |
|delivery_fee |string |null: false                   |
|prefecture   |string |null: false                   |
|delivery_days|string |null: false                   |
|price        |string |null: false                   |
|comment      |string |                              |
|user_id      |integer|null: false, foreign_key: true|
|category_id  |integer|null: false, foreign_key: true|
|brand_id     |integer|null: false, foreign_key: true|
|order_id     |integer|null: false, foreign_key: true|

belongs_to :user
belongs_to :brand
has_many :images
belongs_to :category

## orderテーブル
|Column       |Type   |Options                       |
|post_cord    |integer|null: false                   |
|prefecture   |string |null: false                   |
|city         |string |null: false                   |
|house_number |integer|null: false                   |
|building_name|integer|null: false                   |
|phone        |integer|null: false                   |
|user_id      |integer|null: false, foreign_key: true|

belongs_to :user

## cardテーブル
|Column        | Type  |Options                       |
|card_number   |string |null: false                   |
|date_of_expiry|data   |null: false                   |
|security_code |integer|null: false                   |
|user_id       |integer|null: false, foreign_key: true|

belongs_to :user

## imageテーブル
|Column  |Type  |Options                       |
|image   |string|null: false                   |
|item_id |string|null: false, foreign_key: true|
|order_id|string|null: false, foreign_key: true|

belongs_to :item

## categoryテーブル
|Column  |Type  |Options    |
|name    |string|null: false|
|ancestry|string|null: false|

has_many :items

## brandテーブル
|Column|Type  |Options    |
|name  |string|null: false|

has_many :item