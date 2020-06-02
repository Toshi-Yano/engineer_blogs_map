require 'rails_helper'
RSpec.describe Review do
  describe "#create" do
    describe "バリデーション確認（presence true）" do

      xit "全項目が入力されていれば登録できること" do
        review = build(:review)
        expect(review).to be_valid
      end

      it "nameが空の場合は登録できないこと" do
        review = build(:review, body: nil)
        review.valid?
        expect(review.errors[:body]).to include("が入力されていません。")
      end

    end
  end
end