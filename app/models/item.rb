class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :scheduled_delivery_id, numericality: {other_than: 1 }
  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to:300 ,less_than_or_equal_to:9999999}

end
