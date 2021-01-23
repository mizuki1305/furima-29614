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
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :listings
- belongs_to :purchases

## listingsテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| image    | string | null: false |
| text     | string | null: false |
| price    | string | null: false |
| address  | string | null: false |

### Association
- has_many :purchases
- belongs_to :users

## purchases

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| card     | string | null: false |
| address  | string | null: false |
| number   | string | null: false |

### Association
- belongs_to :listings
- belongs_tp :users
