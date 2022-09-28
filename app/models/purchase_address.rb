class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel, :token

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city
  validates :house_number
  validates :tel, format: { with: /\A\d{10,11}\z/ }
  validates :token
  end
  
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, tel: tel, purchase_id: purchase.id)
  end
end