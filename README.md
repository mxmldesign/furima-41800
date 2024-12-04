# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

# テーブル設計

##usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
|nickname            | string | null: false |
|email               | string | null: false |
|encrypted_password  | string | null: false |
|surname_in_kanji    | string | null: false |
|first_name_in_kanji | string | null: false |
|surname_in_kana     | string | null: false |
|first_name_in_kana  | string | null: false |
|year_of_birth_id    | integer | null: false |
|month_of_birth_id   | integer | null: false |
|date_of_birth_id    | integer | null: false |


### Association
- has_many :items
- has_many :orders



##itemsテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
|title               | string | null: false  |
|description         | text | null: false |
|category_id         | integer | null: false |
|condition_id        | integer | null: false |
|shipping_fee_id     | integer | null: false |
|ship_from_id        | integer | null: false |
|delivering_days_id  | integer | null: false |
|price               | integer | null: false |
|user_id             | references | null: false |

### Association
- belongs_to :user
- has_one : order



##ordersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
|item_id             | references | null: false  |
|shipping_address_id | references | null: false |

### Association
- belongs_to :user
- belongs_to :order
- has_one :shipping_address



##shipping_addressテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
|post_code           | integer | null: false |
|prefecture_id       | integer | null: false |
|city                | string | null: false |
|street              | string | null: false |
|building            | string | null: true |
|phone_number        | integer | null: false |
|item_id             | references | null: false  |
|order_id            | references | null: false |

### Association
- belongs_to :order


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
