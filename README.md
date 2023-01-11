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
|Column              |Type                 |Options                    |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| birthday           | date                | null: false               |
| name_kana          | string              | null: false               |
| name               | string              | null: false               |
| sei_kana           | string              | null: false               |
| sei                | string              | null: false               |
| nickname           | string              | null: false               |
|------|----|-------|

### Association
* has_many :items
* has_many :buys


## items table #商品
|Column                               |Type        |Options                         |
| title                               | string     | null: false                    | ## 商品名
| concept                             | text       | null: false                    | ## 商品説明
| user                                | references | null: false, foreign_key: true | ## 出品者
| price                               | integer    | null: false                    | ## 商品の値段
| category_id                         | integer    | null: false                    | ## カテゴリー
| status_id                           | integer    | null: false                    | ## 商品の状態
| delivery_charge_burden_id           | integer    | null: false                    | ## 配送料負担
| prefecture_id                       | integer    | null: false                    | ## 発送元の地域/都道府県
| shipping_day_id                     | integer    | null: false                    | ## 発送までの日数
|------|----|-------|
### Association
- belongs_to :user
- has_one :buy

## shippings table #配送先住所情報
|Column          |Type       |Options        |
|post_code       |string     | null: false   | ##郵便番号
|prefecture_id   |integer    | null: false   | ##都道府県
|city            |string     | null: false   | ##市区町村
|address         |string     | null: false,  | ##番地
|building_name   |string     |               | ##建物名
|telephone_number|string     | null: false   | ##電話番号
|------|----|-------|
### Association
belongs_to :buy

## buys table #商品購入履歴テーブル
|Column          |Type          |Options                         |
|address         |references    | null: false, foreign_key: true | ##番地
|building_name   |references    | foreign_key: true              | ##建物名
|telephone_number|references    | null: false, foreign_key: true | ##電話番号
|user            |references    | null: false, foreign_key: true | ##ユーザー
|item            |references    | null: false, foreign_key: true | ##商品
### Association

belongs_to :user
belongs_to :item
has_one :shipping