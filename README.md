# BallparkLog
 SNS形式プロ野球観戦記録投稿サイトです。<br>
 球場観戦のリアルな思い出を記録し、またそれを共有した交流ができます。 <br>
 レスポンシブ対応しているので、スマートフォンからもご覧いただけます。
 <br>
 <br>
<img width="1435" alt="スクリーンショット 2021-03-25 15 37 08" src="https://user-images.githubusercontent.com/70847530/112435499-27ef6080-8d88-11eb-91a9-27bb5bf16cc4.png">
![B17CACB9-B9D3-4F20-8D49-B291DDA4119D_1_105_c](https://user-images.githubusercontent.com/70847530/112435892-af3cd400-8d88-11eb-8da0-0c717ed8b8a3.jpeg)

## URL
https://ballparklog.work

## 使用技術

- Ruby 2.7.0
- Ruby on Rails 6.0.3.5
- PostgreSQL 11.5
- Nginx
- Puma
- AWS
  - VPC
  - EC2
  - S3
  - CloudWatch
- Capistrano 3.16.0
- RSpec
- Docker
- CircleCi


## 機能一覧
- ユーザー登録、ログイン機能
- メール配信機能(ActiveMailer・Gmail)
- スクレイピング機能
- 投稿機能
  - 画像ファイルアップロード(ActiveStorage・s3)
  - 画像プレビュー
  - 投稿一覧・詳細表示機能
- いいね機能(Ajax)
- コメント機能
- ページネーション機能(kaminari)

## テスト
- RSpec
