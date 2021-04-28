# frozen_string_literal: true

# config/deploy.rb
# capistranoのバージョン固定
lock "3.16.0"
# デプロイするアプリケーション名
set :application, "BallparkLog"
# cloneするgitのリポジトリ
set :repo_url, "git@github.com:Hannosuke/ballparklog.git"
# deployするブランチ。デフォルトはmaster
# この記載をすることで bundle exec cap production deploy BRANCH=ブランチ名で特定のブランチをデプロイできるようになる
set :branch, ENV["BRANCH"] || "master"
# deploy先のディレクトリ。
set :deploy_to, "/var/www/BallparkLog"
# シンボリックリンクをはるファイル
set :linked_files, %w[config/master.key config/database.yml puma.rb]
# シンボリックリンクをはるフォルダ
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets]
# 保持するバージョンの個数
set :keep_releases, 3
# rubyのバージョン
set :rbenv_ruby, "2.7.2"
# システムワイドにインストールされているRubyを使用する
set :rbenv_type, :system
# デプロイ実行時に出力するログのレベル。
set :log_level, :debug
