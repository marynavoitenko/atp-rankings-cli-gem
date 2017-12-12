class AtpRankingsCliGem::CLI

  def call
    AtpRankingsCliGem::Scraper.scrape_rankings_page
    puts ""
    puts "~~~ Welcome to ATP World Tour Rankings! ~~~"
    display_rankings
    input = ""
    until input == "exit" do
      puts ""
      puts "Type player's ranking (1-10) to learn about his recent activity."
      puts "Type 'rankings' to see Top 10 players, or type 'exit'"
      puts ""
      input = gets.strip
      if input == "rankings"
        display_rankings
      elsif input.to_i.between?(1,10)
        puts ""
        puts "Last event played..."
        puts "Last opponent played..."
        puts ""
      elsif input != "exit"
        puts "O_o invalid input."
      end

    end
    puts "See you later!"
  end

  def display_rankings
    puts ""
    puts "Top 10 Tennis Players:"
    puts ""
    # puts "1. Rafael Nadal"
    # puts "2. Roger Federer"
    # puts "3. Marat Safin"
    AtpRankingsCliGem::Player.all.each.with_index do |player, i|
      puts "#{i}. #{player.name} - #{player.country} - age: #{player.age}"
    end
    puts ""
  end

end
