# EngineerBlogs.map!
〜技術ブログ共有アプリ〜
![top-image](https://user-images.githubusercontent.com/62419040/82435702-a677d380-9acf-11ea-93b5-db6200aef2f3.jpg)
![blog_index](https://user-images.githubusercontent.com/62419040/82435799-cb6c4680-9acf-11ea-9f23-55644aa24909.jpg)
<p>&nbsp</p>

## 本番環境URL
http://54.95.87.200

## テストユーザー
メールアドレス　test@gmail.com<br>パスワード　1111aaaa
<p>&nbsp</p>

# コンセプト
より良い情報ソースを発見する手段としてこのアプリを作成しました。
Qiita・teratail・StackOverflowなど、プログラミングの情報ソースは多岐に渡ります。その中で、あえて個人ブログから情報を探す人は非常に少ないと思います。実際、ブログによって記事の方向性・分かり易さ・信憑性・取り扱い言語・技術レベルなどは多種多様で、特定の情報を求めている際には不向きなようにも感じます。実際、特にプログラミング初学者にとっては、個人ブログを閲覧する優先度は低いとの意見が大勢でした。<br>
しかし、中には自分に合ったブログも存在します。そんなブログを共有・発見できる場を設けたいと思い、多くのユーザーに使ってもらえるようなアプリを目指して開発しました。
<p>&nbsp</p>

# 使用言語、フレームワーク、データベース
- haml&Sass
- JavaScript
- jQuery
- Ruby
- Ruby on Rails
- MySQL
- AWS
<p>&nbsp</p>

# このアプリでできること、実装していること
- ユーザー登録(gem:devise)
- ブログの共有
- ブログに紐づくタグのインクリメンタルサーチ（ブログ登録時・検索時）
- お気に入り機能（非同期）
- 記事検索、並べ替え(gem:ransack)
- レビュー投稿
- マイブログ登録
<p>&nbsp</p>

# 主な実装内容

## お気に入り機能
![like_blog_action](https://user-images.githubusercontent.com/62419040/82435748-b8f20d00-9acf-11ea-9747-bde06a375883.gif)
紹介されているブログのお気に入り機能を非同期で実装しています。トップページでは個人・企業のカテゴリ別に、お気に入り登録数上位10件が表示されており、人気コンテンツにスムーズにアクセスできるようになっています。
<p>&nbsp</p>

## 記事検索、並べ替え
![blog_search](https://user-images.githubusercontent.com/62419040/82435783-c4ddcf00-9acf-11ea-8b85-027dda6a8918.gif)
gem:ransackを用いて、タイトル・紹介文・タグの複合検索を実装しています。タグ情報は1万件以上登録されているため、インクリメンタルサーチで選択できるようになっています。  
並べ替え機能については、現在は登録日時順のみ実装しています（今後お気に入り登録件数順なども対応させる予定です）。
<p>&nbsp</p>

## レビュー投稿
![blog_show](https://user-images.githubusercontent.com/62419040/82435782-c4453880-9acf-11ea-8d54-072cf7366c28.jpg)
ブログ詳細ページから、レビューの投稿・閲覧が可能です。投稿に関して、ブログ内特定記事のおすすめは任意です。そのため、単にブログ全体へのレビューと使い分けが可能です。
<p>&nbsp</p>

## マイブログ登録
![myblog_create](https://user-images.githubusercontent.com/62419040/82435715-ac6db480-9acf-11ea-8561-ec944d62fc1a.gif)
ブログ共有時に自動で入る`user_id`
このアプリは、自身のブログに限らず幅広く共有してもらうことが前提のため

<p>&nbsp</p>
<p>&nbsp</p>

# 今後のアップデート

<br>

<p>&nbsp</p>

# 参考 DB設計
![ER](https://user-images.githubusercontent.com/62419040/82435780-c4453880-9acf-11ea-94b2-4cee199ece5f.jpeg)
