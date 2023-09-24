# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| nickname           | string | null:false              |
| email              | string | null:false, unique:true |
| encrypted_password | string | null:false              |
| last_name          | string | null:false              |
| first_name         | string | null:false              |
| last_nme_kane      | string | null:false              |
| first_name_kana    | string | null:false              |
| birth_date         | date   | null:false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                  |
| user             | references | null:false, foreign:true |
| name             | string     | null:false               |
| detail           | text       | null:false               |
| price            | integer    | null:false               |
| quality_id       | integer    | null:false               |
| shipping_fee_id  | integer    | null:false               |
| prefecture_id    | integer    | null:false               |
| shipping_date_id | integer    | null:false               |
| category_id      | integer    | null:false               |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                  |
| user    | references | null:false, foreign:true |
| item    | references | null:false, foreign:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :payment

## payments テーブル

| Column         | Type       | Options                       |
| order          | references | null:false, foreign_key: true |
| postcode       | string     | null:false                    |
| prefecture_id  | integer    | null:false                    |
| city           | string     | null:false                    |
| address_number | string     | null:false                    |
| building       | string     |                               |
| phone_number   | string     | null:false                    |

### Association

- belongs_to :order