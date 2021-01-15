class Item < ApplicationRecord
  # Association
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :fare
  belongs_to :province
  belongs_to :shipment_day
  belongs_to :status

  # Validation
  validates :name, :detail, :image, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :fare_id
    validates :province_id
    validates :shipment_day_id
    validates :status_id
  end
end
