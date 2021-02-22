namespace :game_result do
    desc "試合結果を取得する"
    task fetch: :environment do
        start_date = Date.parse("2020-06-19")
        end_date = Date.parse("2020-06-20")
        (start_date..end_date).each do |game_date|
            url = "https://baseball.yahoo.co.jp/npb/schedule/?date=#{game_date.to_s}"
            
            charset = nil
            html = URI.open(url) do |f|
                charset = f.charset
                f.read
            end

            doc = Nokogiri::HTML.parse(html, nil, charset)
            doc.css(".bb-score__content").each do |node|
                home_team = node.css(".bb-score__homeLogo").first.content
                visitor_team = node.css(".bb-score__awayLogo").first.content
                home_score = node.css(".bb-score__score--left").first.content
                visitor_score = node.css(".bb-score__score--right").first.content

                p home_team
                p home_score
                p visitor_score
                p visitor_team

                visitor_team = Team.find_by(first_name: visitor_team)
                home_team = Team.find_by(first_name: home_team)


                Game.create(date: game_date.to_s, visitor_team_id: visitor_team.id, home_team_id: home_team.id, visitor_score: visitor_score, home_score: home_score)
            end
            sleep 1
        end
    end
end