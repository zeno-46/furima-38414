require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    describe '購入登録' do
      context '登録できるとき' do
        it '必須項目が全てあれば登録できる' do
          expect(@purchase_address).to be_valid
        end

        it '建物名が空欄でも登録できる' do
          @purchase_address.building_name = ''
          expect(@purchase_address).to be_valid
        end
      end

      context '登録できないとき' do
        it '郵便番号が空欄だと登録できない' do
          @purchase_address.postal_code = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
        end

        it '郵便番号にハイフンが含まれていないと登録できない' do
          @purchase_address.postal_code = 111-1111
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "Postal code is invalid"
        end

        it '都道府県が空欄だと登録できない' do
          @purchase_address.prefecture_id = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "Prefecture can't be blank"
        end

        it '都道府県が1だと登録できない' do
          @purchase_address.prefecture_id = 1
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "Prefecture must be other than 1"
        end

        it '市区町村が空欄だと登録できない' do
          @purchase_address.city = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "City can't be blank"
        end

        it 'house_numberが空欄だと登録できない' do
          @purchase_address.house_number = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "House number can't be blank"
        end

        it '電話番号が空欄だと登録できない' do
          @purchase_address.tel = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "Tel can't be blank"
        end

        it '電話番号にハイフンがあると登録できない' do
          @purchase_address.tel = '000 - 0000 - 0000'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "Tel is invalid"
        end

        it '電話番号が12桁以上だと登録できない' do
          @purchase_address.tel = '000000000000'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "Tel is invalid"
        end

        it '電話番号が9桁以下だと登録できない' do
          @purchase_address.tel = '000000000'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "Tel is invalid"
        end

        it 'カード情報が空欄だと登録できない' do
          @purchase_address.token = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
        end

        it 'Userが紐付いていなければ購入できない' do
          @purchase_address.user_id = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "User can't be blank"
        end

        it 'Itemが紐付いていなければ購入できない' do
          @purchase_address.item_id = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include "Item can't be blank"
        end
      end
    end
end