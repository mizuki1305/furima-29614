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
# テーブル設計

## usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | 
| name     | string | null: false |
| ruby     | string | null: false |
| birthday | string | null: false |

### Association
- has_many :listings
- belongs_to :purchases

## listingsテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| product  | string | null: false |
| text     | string | null: false |
| category | string | null: false |
| state    | string | null: false |
| burden   | string | null: false |
| area     | string | null: false |
| days     | string | null: false |
| price    | string | null: false |
| user_id  | string | null: false |

### Association
- has_many :purchases
- has_many :address, through: listings_address
- has_many :listings_address
- belongs_to :users

## purchases

| Column     | Type   | Options     |
| ---------  | ------ | ----------- |
| card       | string | null: false |
| date       | string | null: false |
| security   | string | null: false |
| user_id    | string | null: false |
| listing_id | string | null: false |

### Association
- belongs_to :listings
- belongs_to :users

## address

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| postcode   | string | null: false |
| prefecture | string | null: false |
| city       | string | null: false |
| town       | string | null: false |
| building   | string | null: false |
| number     | string | null: false |
| listing_id | string | null: false |

### Association
- has_many :listings, through: listings_address
- has_many :purchases
- has_many :listings_address

## listings_address

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | string     |                                |
| purchases_id | references | null: false, foreign_key: true |
| address_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :listings
- belongs_to :address