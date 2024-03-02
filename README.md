README

# users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

# items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| item_description      | text       | null: false                    |
| category_id           | integer    | null: false                    |
| condition_id          | integer    | null: false                    |
| postage_id            | integer    | null: false                    |
| ship_from_location_id | integer    | null: false                    |
| shipping_days_id      | integer    | null: false                    |
| price                 | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

# orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ | 
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer

# buyers テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| post_code             | string     | null: false                    |
| prefecture_id         | integer    | null: false                    |
| city                  | string     | null: false                    |
| address               | string     | null: false                    |
| building_name         | string     | null: false                    |
| phone_number          | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :order

# cards テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| user_id         | integer   | null: false                    |
| customer_id     | string    | null: false                    |
| card_id         | string    | null: false                    |

### Association

- belongs_to :user

