require 'rails_helper'
RSpec.describe Review do
  describe "#create" do
    describe "バリデーション確認（presence true）" do

      it "全項目が入力されていれば登録できること" do
        review = build(:review)
        expect(review).to be_valid
      end
      
      it "article_urlが空でも登録できること" do
        review = build(:review, article_url: nil)
        expect(review).to be_valid
      end

      it "article_titleが空でも登録できること" do
        review = build(:review, article_title: nil)
        expect(review).to be_valid
      end
      
      it "bodyが空の場合は登録できないこと" do
        review = build(:review, body: nil)
        review.valid?
        expect(review.errors[:body]).to include("が入力されていません。")
      end

      it "bodyが201文字以上なら登録できないこと" do
        review = build(:review, body: "ちょうど２００文字超。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。ちょうど２００文字。")
        review.valid?
        expect(review.errors[:body]).to include("は200文字以下に設定して下さい。")
      end

      it "article_titleが101文字以上なら登録できないこと" do
        review = build(:review, article_title: "ちょうど１００文字超。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。")
        review.valid?
        expect(review.errors[:article_title]).to include("は100文字以下に設定して下さい。")
      end

    end
  end
end