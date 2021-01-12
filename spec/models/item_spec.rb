require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    it 'すべての情報を正しく入力すると出品される' do
      expect(@item).to be_valid
    end

    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.detail = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end
    it 'カテゴリーの情報が---の時登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end

    it '商品の状態についての情報が必須であること' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Status is not a number')
    end
    it '商品の状態についての情報が---の時登録できない' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 0')
    end

    it '配送料の負担についての情報が必須であること' do
      @item.fare_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Fare is not a number')
    end
    it '配送料の負担についての情報が---の時登録できない' do
      @item.fare_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Fare must be other than 0')
    end

    it '発送元の地域についての情報が必須であること' do
      @item.province_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Province is not a number')
    end
    it '発送元の地域についての情報が---の時登録できない' do
      @item.province_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Province must be other than 0')
    end

    it '発送までの日数についての情報が必須であること' do
      @item.shipment_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipment day is not a number')
    end
    it '発送までの日数についての情報が---の時登録できない' do
      @item.shipment_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipment day must be other than 0')
    end

    it '価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格の範囲が、¥300以上であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の範囲が、¥9,999,999未満であること' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
