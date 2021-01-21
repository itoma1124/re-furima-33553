class Item < ApplicationRecord
  # Association
  belongs_to :user
  has_one :order
  has_one_attached :image
  has_many :comments,dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :fare
  belongs_to :province
  belongs_to :shipment_day
  belongs_to :status

  def previous
    Item.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    Item.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end

  # Validation
  validates :name, :detail, :image, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options presence: { message: "を選択してください。" },numericality: { other_than: 0 } do
    validates :category_id
    validates :fare_id
    validates :province_id
    validates :shipment_day_id
    validates :status_id
  end
end
