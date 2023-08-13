# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| nickname           | string | null:false, unique:true |
| email              | string | null:false, unique:true |
| encrypted_password | string | null:false, unique:true |
| last_name          | string | null:false              |
| first_name         | string | null:false              |
| last_nme_kane      | string | null:false              |
| first_name_kana    | string | null:false              |
| birth_date         | date   | null:false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                  |
| user            | references | null:false, foreign:true |
| title           | string     | null:false               |
| detail          | string     | null:false               |
| price           | integer    | null:false               |

### Association

- belogs_to :user
- has_many :order

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
| postcode       | integer    | null:false                    |
| prefecture     | string     | null:false                    |
| city           | string     | null:false                    |
| address_number | string     | null:false                    |
| building       | string     | null:false                    |
| phone_number   | integer    | null:false                    |

### Association

- belongs_to :order