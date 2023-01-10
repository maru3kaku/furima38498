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


## users table #ユーザー
|Column|Type|Options|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| birthday           | string              | null: false               |
| name kana          | text                | null: false               |
| name               | text                | null: false               |
| nickname           | text                | null: false               |
|------|----|-------|

### Association
* has_many :items
* has_many :buys
has_many :shippings

## items table #商品
|Column|Type|Options|
| title                               | string     | null: false                    | ## 商品名
| concept                             | text       | null: false                    | ## 商品説明
| user                                | references | null: false, foreign_key: true | ## 出品者
| price                               | integer    | null: false                    | ## 商品の値段
| category_id                         | integer    | null: false                    | ## カテゴリー
| status_id                           | integer    | null: false                    | ## 商品の状態
| delivery charge burden_id           | integer    | null: false                    | ## 配送料負担
| prefectures_id                    | integer    | null: false                    | ## 発送元の地域/都道府県
| shipping day_id                     | integer    | null: false                    | ## 発送までの日数
|------|----|-------|
### Association
- belongs_to :user
- has_one :buy
  has_one :shippings

## shippings table #配送先住所情報
|Column|Type|Options|
|post code       |integer    | null: false                    | ##郵便番号
|prefectures_id  |integer    | null: false                    | ##都道府県
|city            |text       | null: false                    | ##市区町村
|address         |text       | null: false                    | ##番地
|building name   |text       | null: false                    | ##建物名
|telephone number|integer    | null: false                    | ##電話番号
|------|----|-------|
### Association

belongs_to :user
belongs_to :buy
belongs_to :item

## buys table #商品購入履歴テーブル
| title                               | string     | null: false                    | ## 商品名
| delivery charge burden_id           | integer    | null: false                    | ## 配送料負担
### Association

belongs_to :user
belongs_to :buy
belongs_to :item