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

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: fa;se               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_ruby   | string | null: false               |
| first_name_ruby    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :listings
- has_many :purchases

## listingsテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| product     | string  | null: false |
| text        | string  | null: false |
| category_id | integer | null: false |
| state_id    | integer | null: false |
| burden_id   | integer | null: false |
| area_id     | integer | null: false |
| days_id     | integer | null: false |
| price_id    | integer | null: false |
| user_id     | string  | null: false |

### Association
- has_many :purchases
- has_many :address
- belongs_to :users

## purchasesテーブル

| Column     | Type   | Options     |
| ---------  | ------ | ----------- |
| user_id    | string | null: false |
| listing_id | string | null: false |

### Association
- belongs_to :listings
- belongs_to :users
- has_many :address

## addressテーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| postcode   | string  | null: false |
| area_id    | integer | null: false |
| city       | string  | null: false |
| town       | string  | null: false |
| building   | string  | null: false |
| number     | string  | null: false |
| listing_id | string  | null: false |

### Association
- belongs_to :listings
- belongs_to :purchases
