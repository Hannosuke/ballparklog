namespace :game_result do
    desc "試合結果を取得する"
    task fetch: :environment do
        start_date = Date.parse("2020-06-19")
        end_date = Date.parse("2020-11-25")
        game_month = []
        (start_date..end_date).each do |months|
            months = months.strftime("%m")
            game_month.push(months)
        end
        game_month = game_month.uniq
        game_month.each do |read_month|
            url =  "https://npb.jp/games/2020/schedule_#{read_month}_detail.html"
            
            charset = nil
            html = URI.open(url) do |f|
                charset = f.charset
                f.read
            end

            doc = Nokogiri::HTML.parse(html, nil, charset)
            (start_date..end_date).each do |game_date|
                game_day = game_date.strftime("%m%d")
                unless doc.css("#date#{game_day}").css(".team1").present?
                    next
                end

                doc.css("#date#{game_day}").each do |node|
                    if node.css(".cancel").present?
                        next
                    end
                    

                    home_team = node.css(".team1").first.content
                    visitor_team = node.css(".team2").first.content
                    home_score = node.css(".score1").first.content
                    visitor_score = node.css(".score2").first.content


                    visitor_team = Team.find_by(first_name: visitor_team)
                    home_team = Team.find_by(first_name: home_team)
                    Game.create(date: game_date.to_s, visitor_team_id: visitor_team.id, home_team_id: home_team.id, visitor_score: visitor_score, home_score: home_score)
                end
            end
            sleep 1
        end   
    end
end