require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    context '新規登録できる場合' do
      it 'すべての項目が適切に入力されていれば新規登録ができる' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context '新規登録できない場合' do

      it 'ニックネームが空だと登録できない' do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end

      it '名字が空だと登録できない' do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end

      it '苗字が空だと登録ができない' do
        user = build(:user, last_name: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end

      it '名字（カナ）が空だと登録できない' do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '苗字（カナ）が空だと登録できない' do
        user = build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it '名字が半角だと登録できない' do
        user = build(:user, last_name: "ﾊﾝｶｸ")
        user.valid?
        expect(user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
  
      it '苗字が半角だと登録できない' do
        user = build(:user, first_name: "ﾊﾝｶｸ")
        user.valid?
        expect(user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
  
      it '名字（カナ）が半角だと登録できない' do
        user = build(:user, last_name_kana: "ﾊﾝｶｸ")
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
  
      it '苗字（カナ）が半角だと登録できない' do
        user = build(:user, first_name_kana: "ﾊﾝｶｸ")
        user.valid?
        expect(user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end


      it '誕生日が空だと登録できない' do
        user = build(:user, birthday: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'パスワードが6文字未満だと登録できない' do
        user = build(:user, password: '12345', password_confirmation: '12345')
        user.valid?
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードが英字のみだと登録できない' do
        user = build(:user, password: 'abcdef', password_confirmation: 'abcdef')
        user.valid?
        expect(user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it 'パスワードが数字のみだと登録できない' do
        user = build(:user, password: '123456', password_confirmation: '123456')
        user.valid?
        expect(user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
    end
  end
end
