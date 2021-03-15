# BallparkLog
 プロ野球観戦記録投稿サイトです。<br >
 リアルな思い出を記録し、またそれを共有した交流ができます。 <br >
 レスポンシブ対応しているので、スマートフォンからもご確認いただけます。
<img width="1435" alt="スクリーンショット 2021-03-15 11 06 36" src="https://user-images.githubusercontent.com/70847530/111094377-85143680-857e-11eb-8bd4-96cb69a614bb.png">

# URL
https://ballparklog.work

# 使用技術
- Ruby 2.7.0
- Ruby on Rails 6.0.3.5
- PostgreSQL 11.5
- Nginx
- Puma
- AWS
  - VPC
  - EC2
  - S3
- Capistrano 3.16.0
- RSpec


# 機能一覧
- ユーザー登録、ログイン機能
- メール配信機能(ActiveMailer・Gmail)
- スクレイピング機能
- 投稿機能
  - 画像ファイルアップロード(ActiveStorage)
  - 画像プレビュー
  - 投稿一覧・詳細表示機能
- いいね機能(Ajax)
- コメント機能
- ページネーション機能(kaminari)

# テスト
- RSpec
