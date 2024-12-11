require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品新規出品' do
    context '出品できる場合' do
      it 'titleとdescription、category、condition、shipping_fee、prefecture、delivering_day、imageが適当な値で存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      # 画像関連
      it '画像が添付されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      # 商品名関連
      it '商品名が空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品名が41文字以上では出品できない' do
        @item.title = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Title is too long (maximum is 40 characters)')
      end

      # 商品説明関連
      it '商品説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '商品説明が1001文字以上では出品できない' do
        @item.description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end

      # カテゴリー関連
      it '商品カテゴリーが---（IDが1）では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      # 商品状態関連
      it '商品の状態が---（IDが1）では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      # 配送料負担関連
      it '配送料の負担が---（IDが1）では出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      # 発送元地域関連
      it '発送元の地域が---（IDが1）では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      # 発送日数関連
      it '発送までの日数が---（IDが1）では出品できない' do
        @item.delivering_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivering day can't be blank")
      end

      # 販売価格関連
      it '価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が10,000,000円以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格が半角数字でないと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      # ユーザー関連
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
