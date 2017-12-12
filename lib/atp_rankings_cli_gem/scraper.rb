class AtpRankingsCliGem::Scraper

  BASE_URL = 'http://www.atpworldtour.com'

  def self.rankings_url
    rankings_url = BASE_URL + '/en/rankings/singles'
  end

  def self.profile_url(index)
    profile_url = BASE_URL + AtpRankingsCliGem::Player.all[index].url.gsub("overview", "player-activity")
  end

  def self.scrape_rankings_page
    page = Nokogiri::HTML(open(self.rankings_url))

    page.css('.mega-table tbody tr').each do |player|
      AtpRankingsCliGem::Player.create_from_scraper(player)
    end

  end

  def self.scrape_profile_page(index)
    profile_url = self.profile_url(index.to_i-1)
    page = Nokogiri::HTML(open(profile_url))
    last_event_played = page.css('td.title-content a').first.text
    last_opponent_played = page.css('.day-table-name a').first.text
    AtpRankingsCliGem::Player.all[index.to_i-1].add_player_activity(last_event_played, last_opponent_played)
  end

end
