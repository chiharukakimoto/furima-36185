class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  #has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :delivery_fee

  validates :image, presence: true
  validates :name, presence: true
  validates :item_info, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end
