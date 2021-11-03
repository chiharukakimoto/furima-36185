class Order < ApplicationRecord
  #attr_accessor :token, :price
  belongs_to :item
  has_one :address
  #validates :token, persence: true
  #validates :price, persen
end
