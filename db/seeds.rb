# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

stadiums = Stadium.create([
    {name: "札幌ドーム"},
    {name: "楽天生命パーク宮城"},
    {name: "メットライフドーム"},
    {name: "東京ドーム"},
    {name: "明治神宮野球場"},
    {name: "ZOZOマリンスタジアム"},
    {name: "横浜スタジアム"},
    {name: "バンテリンドーム ナゴヤ"},
    {name: "京セラドーム大阪"},
    {name: "ほっともっとフィールド神戸"},
    {name: "阪神甲子園球場"},
    {name: "MAZDA Zoom-Zoom スタジアム広島"},
    {name: "福岡PayPayドーム"}
])

teams = Team.create([
    {name: "福岡ソフトバンクホークス"},
    {name: "千葉ロッテマリーンズ"},
    {name: "埼玉西武ライオンズ"},
    {name: "東北楽天ゴールデンイーグルス"},
    {name: "北海道日本ハムファイターズ"},
    {name: "オリックスバファローズ"},
    {name: "読売ジャイアンツ"},
    {name: "阪神タイガース"},
    {name: "中日ドラゴンズ"},
    {name: "横浜DeNAベイスターズ"},
    {name: "広島東洋カープ"},
    {name: "東京ヤクルトスワローズ"}
])