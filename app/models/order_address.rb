class OrderAddress

  include ActiveModel::Model

  attr_accessor :postal_code,:province_id,:city,:address_line,:building,:phone_num,:user_id,:item_id,:token

  with_options presence: true do
    validates :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z/, message: '半角数字を使用し,123-4567のように入力してください' }
    validates :province_id , numericality: { other_than: 0 } 
    validates :city,         format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' }
    validates :address_line
    validates :phone_num,    format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください。ハイフン(-)は使用しないでください。' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, province_id: province_id, city: city, address_line: address_line, building: building, phone_num: phone_num, order_id: order.id)
  end
end