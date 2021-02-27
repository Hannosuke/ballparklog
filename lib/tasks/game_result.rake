namespace :game_result do
    desc "試合結果を取得する"
    task fetch: :environment do
        start_date = Date.parse("2020-06-19")
        end_date = Date.parse("2020-06-20")
        (start_date..end_date).each do |game_date|
            url = "https://npb.jp/games/2020/schedule_#{game_date.strftime("%m")}_detail.html"
            
            charset = nil
            html = URI.open(url) do |f|
                charset = f.charset
                f.read
            end

            doc = Nokogiri::HTML.parse(html, nil, charset)
            start_day = "0619"
            end_day = "0620"
            (start_day..end_day).each do |game_day|
            doc.css("#date#{game_day}").each do |node|
                home_team = node.css(".team1").first.content
                visitor_team = node.css(".team2").first.content
                home_score = node.css(".score1").first.content
                visitor_score = node.css(".score2").first.content

                # p home_team
                # p home_score
                # p visitor_score
                # p visitor_team

                visitor_team = Team.find_by(first_name: visitor_team)
                home_team = Team.find_by(first_name: home_team)


                Game.create(date: game_date.to_s, visitor_team_id: visitor_team.id, home_team_id: home_team.id, visitor_score: visitor_score, home_score: home_score)
            end
            sleep 1
        end
    end
end