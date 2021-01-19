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
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end

    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it '商品の説明が必須であること' do
      @item.detail = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選択してください。')
    end
    it 'カテゴリーの情報が---の時登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーは0以外の値にしてください')
    end

    it '商品の状態についての情報が必須であること' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を選択してください。')
    end
    it '商品の状態についての情報が---の時登録できない' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態は0以外の値にしてください')
    end

    it '配送料の負担についての情報が必須であること' do
      @item.fare_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担を選択してください。')
    end
    it '配送料の負担についての情報が---の時登録できない' do
      @item.fare_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担は0以外の値にしてください')
    end

    it '発送元の地域についての情報が必須であること' do
      @item.province_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域を選択してください。')
    end
    it '発送元の地域についての情報が---の時登録できない' do
      @item.province_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域は0以外の値にしてください')
    end

    it '発送までの日数についての情報が必須であること' do
      @item.shipment_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を選択してください。')
    end
    it '発送までの日数についての情報が---の時登録できない' do
      @item.shipment_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数は0以外の値にしてください')
    end

    it '価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end
    it '価格の範囲が、¥300以上であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
    end
    it '価格の範囲が、¥9,999,999未満であること' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は数値で入力してください')
    end
  end
end
