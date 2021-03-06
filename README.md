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

| Column      | Type       | Options                   |
| ----------- | ---------- | ------------------------- |
| product     | string     | null: false               |
| text        | text       | null: false               |
| category_id | integer    | null: false               |
| state_id    | integer    | null: false               |
| burden_id   | integer    | null: false               |
| area_id     | integer    | null: false               |
| day_id      | integer    | null: false               |
| price       | integer    | null: false               |
| user        | references | null: false, foreign: true|

### Association
- has_one :purchase
- belongs_to :user

## purchasesテーブル

| Column     | Type       | Options                    |
| ---------  | ---------- | -------------------------- |
| user       | references | null: false, foreign: true |
| listing    | references | null: false, foreign: true |

### Association
- belongs_to :listing
- belongs_to :user
- has_one :address

## addressテーブル

| Column      | Type       | Options                    |
| ----------- | ---------- | -------------------------- |
| postcode    | string     | null: false                |
| area_id     | integer    | null: false                |
| city        | string     | null: false                |
| town        | string     | null: false                |
| building    | string     |                            |
| number      | string     | null: false                |
| purchase    | references | null: false, foreign: true |

### Association
- belongs_to :purchase
