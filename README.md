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


## users table
|Column|Type|Options|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| adress             | text                | null: false               | ## 住所
|------|----|-------|

### Association
* has_many :prototypes
* has_many :comments

## item table
|Column|Type|Options|
| title                               | string     | null: false                    | ## 商品名
| concept                             | text       | null: false                    | ## 商品説明
| user                                | references | null: false, foreign_key: true | ## 出品者
| price                               | string     | null: false                    | ## 商品の値段
| shippingprice                       | string     | null: false                    | ## 配送料
| category                            | text       | null: false                    | ## カテゴリー
| status                              | text       | null: false                    | ## 商品状態

|------|----|-------|
### Association
- belongs_to :user
- has_many :comments

## shipping table
|Column|Type|Options|
|shipping area                        | text       | null: false                    | ## 発送地域
|shipping day                         | text       | null: false                    | ## 発送日数
|------|----|-------|
### Association


- belongs_to :user
- has_many :comments
