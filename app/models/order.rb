class Order < ApplicationRecord
  attr_accessor :token, :item.price
  belongs_to :item
  has_one :address
  validates :token, persence: true
end
