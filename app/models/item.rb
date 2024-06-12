class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :deliverycharge
  belongs_to :region
  belongs_to :deliveryday

  validates :image, presence: true
  validates :item, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :situation_id, numericality: { other_than: 1 }
  validates :deliverycharge_id, numericality: { other_than: 1 }
  validates :region_id, numericality: { other_than: 1 }
  validates :deliveryday_id, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end