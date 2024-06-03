## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| lastname           | string | null: false |
| firstname          | string | null: false |
| lastnamekana       | string | null: false |
| firstnamekana      | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :orders
- has_many :items


## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| image              | string     | null: false |
| item               | string     | null: false |
| explanation        | text       | null: false |
| category           | string     | null: false |
| situation          | string     | null: false |
| deliverycharge     | string     | null: false |
| region             | string     | null: false |
| deliveryday        | string     | null: false |
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
- has_many :addresses


## addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postcode           | string     | null: false |
| prefectures        | string     | null: false |
| municipalities     | string     | null: false |
| streetaddress      | string     | null: false |
| buildingname       | string     |             |
| phonenumber        | integer    | null: false |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to:order