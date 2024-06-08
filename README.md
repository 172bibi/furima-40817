## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| lastname           | string | null: false |
| firstname          | string | null: false |
| lastnamekana       | string | null: false |
| firstnamekana      | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :orders
- has_many :items


## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item               | string     | null: false |
| explanation        | text       | null: false |
| category_id        | integer    | null: false |
| situation_id       | integer    | null: false |
| deliverycharge_id  | integer    | null: false |
| region_id          | integer    | null: false |
| deliveryday_id     | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postcode           | string     | null: false |
| region_id          | integer    | null: false |
| municipalities     | string     | null: false |
| streetaddress      | string     | null: false |
| buildingname       | string     |             |
| phonenumber        | string     | null: false |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to:order