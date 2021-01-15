require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  it"正しい情報があれば登録できる"do
    expect(@order_address).to be_valid
  end

  it"クレジットカード情報(token)がないと登録出来ない"do
    @order_address.token = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end

  it"郵便番号がないと登録出来ない"do
    @order_address.postal_code = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
  end

  it"郵便番号に「-」がないと登録出来ない"do
    @order_address.postal_code = "1234567"
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code 半角数字を使用し,123-4567のように入力してください")
  end

  it"都道府県がないと登録出来ない"do
    @order_address.province_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Province can't be blank", "Province is not a number")
  end

  it"都道府県が---では登録出来ない"do
    @order_address.province_id = 0
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Province must be other than 0")
  end

  it"市町村がないと登録出来ない"do
    @order_address.city = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("City can't be blank")
  end

  it"番地がないと登録出来ない"do
    @order_address.address_line = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Address line can't be blank")
  end

  it"電話番号がないと登録出来ない"do
    @order_address.phone_num = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
  end

  it"電話番号に「-」が含まれていると登録出来ない"do
  @order_address.phone_num = "090-123-4567"
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone num 半角数字を使用してください。ハイフン(-)は使用しないでください。")
  end

end
