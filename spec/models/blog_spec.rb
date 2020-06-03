require 'rails_helper'
RSpec.describe Blog do
  describe "#create" do
    describe "バリデーション確認" do

      it "全項目が入力されていれば登録できること" do
        blog = build(:blog)
        expect(blog).to be_valid
      end

      it "bodyが空の場合は登録できないこと" do
        blog = build(:blog, body: nil)
        blog.valid?
        expect(blog.errors[:body]).to include("が入力されていません。")
      end

      it "titleが空の場合は登録できないこと" do
        blog = build(:blog, title: nil)
        blog.valid?
        expect(blog.errors[:title]).to include("が入力されていません。")
      end

      it "urlが空の場合は登録できないこと" do
        blog = build(:blog, url: nil)
        blog.valid?
        expect(blog.errors[:url]).to include("が入力されていません。")
      end

      it "重複したtitleが登録できないこと" do
        blog = create(:blog)
        another_blog = build(:blog, title: blog.title)
        another_blog.valid?
        expect(another_blog.errors[:title]).to include("は既に使用されています。")
      end

      it "重複したurlが登録できないこと" do
        blog = create(:blog)
        another_blog = build(:blog, url: blog.url)
        another_blog.valid?
        expect(another_blog.errors[:url]).to include("は既に使用されています。")
      end

      it "titleが101文字以上なら登録できないこと" do
        blog = build(:blog, title: "ちょうど１００文字超。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。ちょうど１００文字。")
        blog.valid?
        expect(blog.errors[:title]).to include("は100文字以下に設定して下さい。")
      end

      it "bodyが401文字以上なら登録できないこと" do
        blog = build(:blog, body: "ちょうど４００１文字超。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。ちょうど４００文字。")
        blog.valid?
        expect(blog.errors[:body]).to include("は400文字以下に設定して下さい。")
      end

    end
  end
end