class AtpRankingsCliGem::Player
  attr_accessor :name, :country, :age, :url, :last_event, :last_opponent

  @@all = []

  def initialize (name, country, age, url, last_event=nil, last_opponent=nil)
    @name = name
    @country = country
    @age = age
    @url = url
    @last_event = last_event if last_event
    @last_opponent = last_opponent if last_opponent
  end

  def self.create_from_scraper(player)
    self.new(
      player.css('td.player-cell').text.strip,
      player.css('td.country-cell div div img')[0]['alt'],
      player.css('td.age-cell').text.strip,
      player.css('td.player-cell a')[0]['href']
    )
    @@all << self

  end

  def self.all
    @@all
  end
  
end
