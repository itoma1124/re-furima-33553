#テーブル設計

## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday_id        | date    | null: false               |

### Association
- has_many :items
- has_many :purchases

## items テーブル (Active Recordでimageを追加)
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| detail          | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| fare_id         | integer    | null: false                    |
| province_id     | integer    | null: false                    |
| shipment_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル
| Column       | Type       | Options                        | 
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル
| Column       | Type       | Options                        | 
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| province_id  | integer    | null: false                    |
| city         | string     | null: false                    |
| address_line | string     | null: false                    |
| building     | string     |                                |
| phone_num    | string     | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
