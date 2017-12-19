class AtpRankingsCliGem::Scraper

  BASE_URL = 'http://www.atpworldtour.com'

  def self.get_page(page)
    Nokogiri::HTML(open(page))
  end

  def self.scrape_rankings_page
    rankings_url = BASE_URL + '/en/rankings/singles'
    page = self.get_page(rankings_url)
    page.css('.mega-table tbody tr')[0..9].each do |player|
      name = player.css('td.player-cell').text.strip
      country = player.css('td.country-cell div div img')[0]['alt']
      age = player.css('td.age-cell').text.strip
      url = player.css('td.player-cell a')[0]['href']
      AtpRankingsCliGem::Player.new(name, country, age, url)
    end

  end

  def self.scrape_profile_page
     AtpRankingsCliGem::Player.all.each do |player|
       profile_url = player.url.gsub("overview", "player-activity")
       page = self.get_page(BASE_URL + profile_url)
       last_event_played = page.css('td.title-content a').first.text
       last_opponent_played = page.css('.day-table-name a').first.text
       winlose = page.css('.activity-tournament-table .mega-table tbody tr td:nth-child(4)').first.text.strip
      player.add_player_activity(last_event_played, last_opponent_played, winlose)
    end
  end

end
