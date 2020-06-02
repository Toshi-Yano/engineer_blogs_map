require 'rails_helper'
RSpec.describe Blog do
  describe "#create" do
    describe "バリデーション確認（presence true）" do

      it "全項目が入力されていれば登録できること" do
        blog = build(:blog)
        expect(blog).to be_valid
      end

      xit "nameが空の場合は登録できないこと" do
        blog = build(:blog, body: nil)
        blog.valid?
        expect(blog.errors[:body]).to include("が入力されていません。")
      end

    end
  end
end