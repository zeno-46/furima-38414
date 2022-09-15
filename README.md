usersテーブル
|Column             |Type  |Options             |
|-------------------|------|--------------------|
|nickname           |string|not null            |
|email              |string|not null,ユニーク制約 |
|encrypted_password |string|not null            |
|first_name         |string|not null            |
|last_name          |string|not null            |
|first_name_kana    |string|not null            |
|last_name_kana     |string|not null            |
|birthday           |date  |not null            |

###Association
has_many :purchases
has_many :items


itemsテーブル
|Column             |Type      |Options             |
|-------------------|----------|--------------------|
|name               |string    |not null            |
|explanation        |text      |not null            |
|category           |integer   |not null            |
|status             |integer   |not null            |
|delivery_fee       |integer   |not null            |
|prefecture         |integer   |not null            |
|scheduled_delivery |integer   |not null            |
|price              |integer   |not null            |
|user               |references|not null, 外部キー    |

###Association
belongs_to :user
has_one :purchase


purchasesテーブル
|Column             |Type      |Options             |
|-------------------|----------|--------------------|
|user               |references|not null,外部キー     |
|item               |references|not null,外部キー     |

###Association
belongs_to :user
belongs_to :item
has_one :address


addressテーブル
|Column             |Type      |Options             |
|-------------------|----------|--------------------|
|postal_code        |string    |not null            |
|prefecture         |integer   |not null            |
|city               |string    |not null            |
|house_number       |string    |not null            |
|building_name      |string    |not null            |
|tel                |string    |not null            |
|purchase           |references|not null,外部キー     |

###Association
belongs_to :purchase