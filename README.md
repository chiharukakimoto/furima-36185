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
|Column            |Type  |Options    |
|nickname          |string|null: false|
|email             |string|null: false|
|encrypted_password|string|null: false|
|family_name       |string|null: false|
|first_name        |string|null: false|
|family_name_kana  |string|null: false|
|first_name_kana   |string|null: false|
|birth_day         |date  |null: false|

has_many :orders
has_many :items

## itemsテーブル
|Column          |Type     |Options                       |
|name            |string   |null: false                   |
|item_info       |string   |null: false                   |
|category_id     |integer  |null: false                   |
|status_id       |integer  |null: false                   |
|delivery_fee_id |integer  |null: false                   |
|prefecture_id   |integer  |null: false                   |
|delivery_days_id|integer  |null: false                   |
|price           |string   |null: false                   |
|comment         |string   |                              |
|user            |reference|null: false, foreign_key: true|

belongs_to :user
belongs_to :customer

## ordersテーブル
|Column       |Type     |Options                       |
|post_cord    |integer  |null: false                   |
|prefecture   |string   |null: false                   |
|city         |string   |null: false                   |
|house_number |integer  |null: false                   |
|building_name|integer  |null: false                   |
|phone        |integer  |null: false                   |
|user         |reference|null: false, foreign_key: true|

belongs_to :user
has_many :customers, through: :orders_customer

## customersテーブル
|Column          |Type     |Options                       |
|family_name     |string   |null: false                   |
|first_name      |string   |null: false                   |
|family_name_kana|string   |null: false                   |
|first_name_kana |string   |null: false                   |
|address         |string   |null: false                   |
|purchase_date   |date     |                              |
|item            |reference|null: false, foreign_key: true|
|user            |reference|null: false, foreign_key: true|

has_one :item
has_many :orders, through: :orders_customer