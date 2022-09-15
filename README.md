usersテーブル
|Column             |Type  |Options                  |
|-------------------|------|-------------------------|
|nickname           |string|null: false              |
|email              |string|null: false, unique: true|
|encrypted_password |string|null: false              |
|first_name         |string|null: false              |
|last_name          |string|null: false              |
|first_name_kana    |string|null: false              |
|last_name_kana     |string|null: false              |
|birthday           |date  |null: false              |

###Association
has_many :purchases
has_many :items


itemsテーブル
|Column                |Type      |Options                       |
|----------------------|----------|------------------------------|
|name                  |string    |null: false                   |
|explanation           |text      |null: false                   |
|category_id           |integer   |null: false                   |
|status_id             |integer   |null: false                   |
|delivery_fee_id       |integer   |null: false                   |
|prefecture_id         |integer   |null: false                   |
|scheduled_delivery_id |integer   |null: false                   |
|price                 |integer   |null: false                   |
|user                  |references|null: false, foreign_key: true|

###Association
belongs_to :user
has_one :purchase


purchasesテーブル
|Column             |Type      |Options                       |
|-------------------|----------|------------------------------|
|user               |references|null: false, foreign_key: true|
|item               |references|null: false, foreign_key: true|

###Association
belongs_to :user
belongs_to :item
has_one :address


addressesテーブル
|Column             |Type      |Options                       |
|-------------------|----------|------------------------------|
|postal_code        |string    |null: false                   |
|prefecture_id      |integer   |null: false                   |
|city               |string    |null: false                   |
|house_number       |string    |null: false                   |
|building_name      |string    |                              |
|tel                |string    |null: false                   |
|purchase           |references|null: false, foreign_key: true|

###Association
belongs_to :purchase