class Item < ApplicationRecord
  belongs_to :user
  has_one :orders
  has_one_attached :image
end
