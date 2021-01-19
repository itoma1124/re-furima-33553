require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, item_id:item.id, user_id:user.id)
    sleep(0.1)
  end

  context"商品購入ができる時"do

    it"正しい情報があれば登録できる"do
      expect(@order_address).to be_valid
    end

    it"建物名がなくても登録できる"do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end

  end

  context"商品購入が出来ない時"do

    it"クレジットカード情報(token)がないと登録出来ない"do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Tokenを入力してください")
    end

    it"郵便番号がないと登録出来ない"do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal codeは半角数字を使用し,123-4567のように入力してください")
    end

    it"郵便番号に「-」がないと登録出来ない"do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal codeは半角数字を使用し,123-4567のように入力してください")
    end

    it"都道府県がないと登録出来ない"do
      @order_address.province_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Provinceを選択してください。")
    end

    it"都道府県が---では登録出来ない"do
      @order_address.province_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Provinceを選択してください。")
    end

    it"市町村がないと登録出来ない"do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Cityを入力してください")
    end

    it"番地がないと登録出来ない"do
      @order_address.address_line = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address lineを入力してください")
    end

    it"電話番号がないと登録出来ない"do
      @order_address.phone_num = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone numを入力してください")
    end

    it"電話番号に「-」が含まれていると登録出来ない"do
      @order_address.phone_num = "090-123-4567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone numは11桁以内の半角数字を使用してください。ハイフン(-)は使用しないでください")
    end

    it"電話番番号が11桁以内でないと登録出来ない"do
      @order_address.phone_num = "090123456789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone numは11桁以内の半角数字を使用してください。ハイフン(-)は使用しないでください")
    end

    it"電話番号が数字のみでなければ登録出来ない"do
      @order_address.phone_num = "一二三四五六七八九"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone numは11桁以内の半角数字を使用してください。ハイフン(-)は使用しないでください")
    end

    it"user_idが空では登録できない"do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Userを入力してください")
    end

    it"item_idが空では登録できない"do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Itemを入力してください")
    end

  end
end
