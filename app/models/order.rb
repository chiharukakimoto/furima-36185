class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :item
  has_one :address
  validates :token, persence: true
end
