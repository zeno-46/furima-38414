require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '出品登録' do
      context '出品ができるとき' do
        it '必須項目が全てあれば出品できる' do
          expect(@item).to be_valid
        end
      end

      context '出品ができないとき' do
        it 'Userが紐付いていなければ出品できない' do
          @item.user =nil
          @item.valid?
          expect(@item.errors.full_messages).to include "User must exist"
        end

        it '商品画像が空欄だと出品できない' do
          @item.image =nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Image can't be blank"
        end

        it '商品名が空欄だと出品できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Name can't be blank"
        end

        it '商品の説明が空欄だと出品できない' do
          @item.explanation = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Explanation can't be blank"
        end

        it 'カテゴリーが空欄だと出品できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Category is not a number"
        end

        it '商品の状態が空欄だと出品できない' do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Status is not a number"
        end

        it '配送料が空欄だと出品できない' do
          @item.delivery_fee_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Delivery fee is not a number"
        end

        it '発送元の地域が空欄だと出品できない' do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Prefecture is not a number"
        end

        it '発送までの日数が空欄だと出品できない' do
          @item.scheduled_delivery_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Scheduled delivery is not a number"
        end

        it '販売価格が空欄だと出品できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is not a number"
        end

        it '販売価格が¥300以下だと出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
        end

        it '販売価格が¥9999999以上だと出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
        end

        it '販売価格が全角数字だと出品できない' do
          @item.price = '１１１１'
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is not a number"
        end

        it 'カテゴリーが1だと出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Category must be other than 1"
        end

        it '商品の状態が1だと出品できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Status must be other than 1"
        end

        it '配送料が1だと出品できない' do
          @item.delivery_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Delivery fee must be other than 1"
        end

        it '発送元の地域が1だと出品できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
        end

        it '発送までの日数が1だと出品できないこと' do
          @item.scheduled_delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Scheduled delivery must be other than 1"
        end
      end
    end
end
