class AtpRankingsCliGem::Scraper

  BASE_URL = 'http://www.atpworldtour.com'

  def self.rankings_url
    rankings_url = BASE_URL + '/en/rankings/singles'
  end

  def self.profile_url(index)
    profile_url = BASE_URL + AtpRankingsCliGem::Player.all[index].url
  end

  def self.scrape_rankings_page
    page = Nokogiri::HTML(open(self.rankings_url))

    page.css('.mega-table tbody tr').each do |player|
      AtpRankingsCliGem::Player.create_from_scraper(player)
    end

    # name = page.css('td.player-cell').first.text.strip
    # contry = page.css('td.country-cell div div img')[0]['alt']
    # age = page.css('td.age-cell').first.text.strip
    # url = page.css('td.player-cell a')[0]['href']

    # from profile page - activity tab
    # http://www.atpworldtour.com/en/players/rafael-nadal/n409/player-activity
    # profile_page = Nokogiri::HTML(open('http://www.atpworldtour.com/en/players/rafael-nadal/n409/player-activity'))
    # Last event played = profile_page.css('td.title-content a').first.text
    # Last opponent played = profile_page.css('.day-table-name a').first.text
  end

  def self.scrape_profile_page(index)
    profile_url = self.profile_url(index-1)
    page = Nokogiri::HTML(open(profile_url))

  end

end
