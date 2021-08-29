# テーブル設計

## users テーブル

| Column          | Type               | Options  |
| --------------- | ------------------ | -------  |
| nickname        | string             | NOT NULL |
| email           | string             | NOT NULL |
| password        | encrypted_password | NOT NULL |
| last_name       | string             | NOT NULL |
| first_name      | string             | NOT NULL |
| last_name_kana  | string             | NOT NULL |
| first_name_kana | string             | NOT NULL |
| birth_year_id   | integer            | NOT NULL |
| birth_month_id  | integer            | NOT NULL |
| birth_day_id    | integer            | NOT NULL |

### Association

- has_many :items
- has_many :orders
- has_one :birth_year
- has_one :birth_month
- has_one :birth_day

## items テーブル

| Column            | Type       | Options  |
| ----------------- | ---------- | -------  |
| name              | string     | NOT NULL |
| introduction      | text       | NOT NULL |
| concept           | text       | NOT NULL |
| price             | integer    | NOT NULL |
| category_id       | integer    | NOT NULL |
| item_condition_id | integer    | NOT NULL |
| prefecture_id     | integer    | NOT NULL |
| delivery_cost_id  | integer    | NOT NULL |
| days_to_ship_id   | integer    | NOT NULL |
| user_id           | references | NOT NULL |

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :item_condition
- belongs_to :prefecture
- belongs_to :delivery_cost
- belongs_to :days_to_ship
- has_one :order

## orders テーブル

| Column      | Type       | Option   |
| ----------- | ---------- | -------- |
| user_id     | references | NOT NULL |
| item_id     | references | NOT NULL |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item

## address テーブル

| Column          | Type       | Options  |
| --------------- | ---------- | -------  |
| postal_code     | string     | NOT NULL |
| city            | string     | NOT NULL |
| house_number    | text       | NOT NULL |
| building_number | integer    | NOT NULL |
| prefecture_id   | integer    | NOT NULL |
| order_id        | references | NOT NULL |

### Association

- belongs_to :order
- belongs_to :prefecture