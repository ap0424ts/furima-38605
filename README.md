
# テーブル設計

## usersテーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birthday        | date   | null: false               |

### Association
- has_many   :orders
- has_many   :items

## itemsテーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| name            | string     | null: false                     |
| content         | text       | null: false                     |
| price           | integer    | null: false                     |
| user_id         | references | null: false, foreign_key: true  |
| category_id     | integer    | numericality: { other_than: 1 } |
| condition_id    | integer    | numericality: { other_than: 1 } |
| charge_id       | integer    | numericality: { other_than: 1 } |
| area_id         | integer    | numericality: { other_than: 1 } |
| day_id          | integer    | numericality: { other_than: 1 } |

### Association
- belongs_to :user
- has_one    :order
- belongs_to :category
- belongs_to :condition
- belongs_to :charge
- belongs_to :area
- belongs_to :day


## ordersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping

## shippingsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | integer    | null: false                    |
| state           | string     | null: false                    |
| city            | string     | null: false                    |
| addres          | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association
- belongs_to :order

#### ここから下は全てactive_hashで実装

| category_id  | integer | null: false                      |
| condition_id | integer | null: false                      |
| charge_id    | integer | null: false                      |
| area_id      | integer | null: false                      |
| day_id       | integer | null: false                      |

### Association
- has_many   :items
