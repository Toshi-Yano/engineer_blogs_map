require 'rails_helper'
RSpec.describe User do
  describe "#create" do
    describe "バリデーション確認（presence true）" do

      it "全項目が入力されていれば登録できること" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "nameが空の場合は登録できないこと" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("が入力されていません。")
      end

      it "introductionが空でも登録できること" do
        user = build(:user, introduction: nil)
        expect(user).to be_valid
      end

      it "emailが空の場合は登録できないこと" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("が入力されていません。")
      end

      it "パスワードが空の場合は登録できないこと" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("が入力されていません。")
      end

      it "パスワード（確認用）が一致しない（空）の場合は登録できないこと" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("が一致しません。")
      end
    end

    describe "バリデーション確認（uniqueness,length）" do
      
      it "重複したnameが登録できないこと" do
        user = create(:user)
        another_user = build(:user, name: user.name)
        another_user.valid?
        expect(another_user.errors[:name]).to include("は既に使用されています。")
      end

      it "重複したemailが登録できないこと" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("は既に使用されています。")
      end

      it "パスワードが6文字以上であれば登録できること" do
        user = build(:user, password: "123456", password_confirmation: "123456")
        user.valid?
        expect(user).to be_valid
      end

      it "パスワードが5文字以下であれば登録できないこと" do
        user = build(:user, password: "12345", password_confirmation: "12345")
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
      end

    end
  end
end