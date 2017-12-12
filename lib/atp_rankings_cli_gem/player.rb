class Player
  attr_accessor :name, :country, :age, :url, :last_event, :last_opponent

  def initialize (name, country, age, url, last_event=nil, last_opponent=nil)
    @name = name
    @country = country
    @age = age
    @url = url
    @last_event = last_event
    @last_opponent = last_opponent
  end

  def create_from_scraper

  end


end
