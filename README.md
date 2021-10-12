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
|Column            |Type  |Options                 |
|nickname          |string|null: false             |
|email             |string|null: false, unique:true|
|encrypted_password|string|null: false             |
|family_name       |string|null: false             |
|first_name        |string|null: false             |
|family_name_kana  |string|null: false             |
|first_name_kana   |string|null: false             |
|birth_day         |date  |null: false             |

has_many :orders
has_many :items

## itemsテーブル
|Column          |Type     |Options                       |
|name            |string   |null: false                   |
|item_info       |text     |null: false                   |
|category_id     |integer  |null: false                   |
|status_id       |integer  |null: false                   |
|user            |reference|null: false, foreign_key: true|

belongs_to :user
has_one :order

## ordersテーブル
|Column      |Type     |Options                       |
|price       |integer  |null: false                   |
|delivery_fee|integer  |null: false                   |
|user        |reference|null: false, foreign_key: true|

belongs_to :user
belongs_to :item
has_one :delivery

## deliveriesテーブル
|Column          |Type   |Options                       |
|post_cord       |string |null: false                   |
|prefecture_id   |integer|null: false                   |
|city            |string |null: false                   |
|house_number    |string |null: false                   |
|building_name   |string |null: false                   |
|family_name     |string |null: false                   |
|first_name      |string |null: false                   |
|family_name_kana|string |null: false                   |
|first_name_kana |string |null: false                   |
|phone           |string |null: false                   |

belongs_to :order