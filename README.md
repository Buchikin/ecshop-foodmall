# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## users テーブル

| Column | Type | Options |
| - | - | - |
| email | string | null: false |
| encrypted_password | string | null: false |
| nickname | string | null: false |

### Association

- has_one :profile
- has_one :charge
- has_many :orders
- has_many :favorite_items
- has_many :favorite_ sellers
- has_many :reviews
- has_many :chats

<br>
<br>

## profiles テーブル

| Column | Type | Options |
| - | - | - |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birth_day | date | null: false |
| phone_number | string | null: false |
| zip_code | string | null: false |
| address | string | null: false |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :user

<br>
<br>

## sellers テーブル

| Column | Type | Options |
| - | - | - |
| store_id | string | null: false |
| encrypted_password | string | null: false |
| store_name | string | null: false |

### Association

- has_one :store
- has_many :favorite_sellers
- has_many :items
- has_many :chats

<br>
<br>

## stores テーブル

| Column | Type | Options |
| - | - | - |
| shopcategory_id | integer | null: false |
| zip_code | string | null: false |
| address | string | null: false |
| phone_number | string | null: false |
| url | string | - |
| information | text | null: false |
| responsible | string | null: false |
| responsible_kana | string | null: false |
| responsible_phone | string | null: false |
| seller | references | null: false, foreign_key: true |

### Association

- belongs_to :seller

<br>
<br>

## items テーブル

| Column | Type | Options |
| - | - | - |
| name | string | null: false |
| price | integer | null: false |
| information | text | null: false |
| tag1 | string | - |
| tag2 | string | - |
| tag3 | string | - |
| tag4 | string | - |
| tag5 | string | - |
| allergies | string | null: false |
| prefecture_id | integer | null: false |
| ship_day_id | integer | null: false |
| ship_type_id | integer | null: false |
| seller | references | null: false, foreign_key: true |

### Association

- has_many :reviews
- has_many :favorite_items
- has_many :orders
- has_one :stock
- belongs_to :seller

<br>
<br>


## stocks テーブル

| Column | Type | Options |
| - | - | - |
| count | integer | null: false |
| item | references | null: false, foreign_key: true |

### Association

- belongs_to :item

<br>
<br>


## orders テーブル

| Column | Type | Options |
| - | - | - |
| quantity | integer | null: false |
| purchase_price | integer | null: false |
| item | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_order
- has_one :review

<br>
<br>

## favorite_sellers テーブル

| Column | Type | Options |
| - | - | - |
| user | references | null: false, foreign_key: true |
| seller | references | null: false, foreign_key: true |

### Association

- belongs_to :seller
- belongs_to :user

<br>
<br>

## favorite_items テーブル

| Column | Type | Options |
| - | - | - |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

<br>
<br>

## reviews テーブル

| Column | Type | Options |
| - | - | - |
| evaluation | integer | null: false |
| text | text | null: false |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |
| order | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :order

<br>
<br>

## rooms テーブル

| Column | Type | Options |
| - | - | - |
| user | references | null: false, foreign_key: true |
| seller | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :seller
- has_many :messages

<br>
<br>

## messages テーブル

| Column | Type | Options |
| - | - | - |
| item_name | text | - |
| message | text | null: false |
| chat | references | null: false, foreign_key: true |

### Association

- belongs_to :chat

<br>
<br>

## shipping_orders テーブル

| Column | Type | Options |
| - | - | - |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| zip_code | string | null: false |
| address | string | null: false |
| order | references | null: false, foreign_key: true |

### Association

- belongs_to :order

<br>
<br>


## charges テーブル

| Column | Type | Options |
| - | - | - |
| charge_count | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :user

<br>
<br>

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...