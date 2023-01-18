require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        @user.password = @user.password_confirmation
        @user.nickname = @user.nickname
        @user.email = @user.email
        @user.valid?
      end
    end

    context '新規登録できないとき' do
    it "メールアドレスが一意性であること。" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Name kana is invalid. Input full-width characters.", "Sei kana is invalid. Input full-width characters.", "Birthday is invalid. Input full-width characters.")
      end
    it "メールアドレスが必須であること。" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスは、@を含む必要があること" do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it "パスワードが必須であること" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは英字のみでは登録できない" do
      @user.password = 'qwerty'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana is invalid. Input full-width characters.", "Sei kana is invalid. Input full-width characters.", "Birthday is invalid. Input full-width characters.")
    end
    it "パスワードは数字のみでは登録できない" do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana is invalid. Input full-width characters.", "Sei kana is invalid. Input full-width characters.", "Birthday is invalid. Input full-width characters.")
    end
    it "パスワードは全角含むと登録できない" do
      @user.password = 'あかさたなは'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana is invalid. Input full-width characters.", "Sei kana is invalid. Input full-width characters.", "Birthday is invalid. Input full-width characters.")
    end
    it "パスワードは、6文字以上での入力が必須であること。" do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it "パスワードとパスワード（確認）は、値の一致が必須であること。" do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名前にひらがな漢字かなのみの入力が必須であること' do
      @user.name = 'asdf'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana is invalid. Input full-width characters.", "Sei kana is invalid. Input full-width characters.", "Birthday is invalid. Input full-width characters.")
    end
it '姓にひらがな漢字かなのみの入力が必須であること' do
  @user.sei = 'asdf'
  @user.valid?
  expect(@user.errors.full_messages).to include("Sei is invalid. Input full-width characters.","Name kana is invalid. Input full-width characters.","Sei kana is invalid. Input full-width characters.","Birthday is invalid. Input full-width characters.")
end
it "名前が必須であること" do
  @user.name = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Name can't be blank")
end
it "姓が必須であること" do
  @user.sei = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Sei can't be blank")
end
it "名前(カナ)が必須であること" do
  @user.name_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Name kana is invalid. Input full-width characters.", "Sei kana is invalid. Input full-width characters.", "Birthday is invalid. Input full-width characters.")
end
it "姓(カナ)が必須であること" do
  @user.sei_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Name kana is invalid. Input full-width characters.", "Sei kana is invalid. Input full-width characters.", "Birthday is invalid. Input full-width characters.")
end
it "誕生日が必須であること" do
  @user.birthday = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Name kana is invalid. Input full-width characters.", "Sei kana is invalid. Input full-width characters.", "Birthday is invalid. Input full-width characters.")
end

end
end
end
