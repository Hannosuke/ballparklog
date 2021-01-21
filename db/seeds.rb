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
    {name: "福岡ソフトバンクホークス", first_name: "ソフトバンク"},
    {name: "千葉ロッテマリーンズ", first_name: "ロッテ"},
    {name: "埼玉西武ライオンズ", first_name: "西武"},
    {name: "東北楽天ゴールデンイーグルス", first_name: "楽天"},
    {name: "北海道日本ハムファイターズ", first_name: "日本ハム"},
    {name: "オリックスバファローズ", first_name: "オリックス"},
    {name: "読売ジャイアンツ", first_name: "巨人"},
    {name: "阪神タイガース", first_name: "阪神"},
    {name: "中日ドラゴンズ", first_name: "中日"},
    {name: "横浜DeNAベイスターズ", first_name: "DeNA"},
    {name: "広島東洋カープ", first_name: "広島"} ,
    {name: "東京ヤクルトスワローズ", first_name: "ヤクルト"},
])