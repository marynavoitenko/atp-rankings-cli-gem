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
        AtpRankingsCliGem::Scraper.scrape_profile_page(input)
        player_profile = AtpRankingsCliGem::Player.all[input.to_i-1]
        puts "Selected player: #{player_profile.name}"
        puts "Last event played: #{player_profile.last_event}"
        puts "Last opponent played: #{player_profile.last_opponent}"
        puts "W/L: #{player_profile.winlose}"
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
    AtpRankingsCliGem::Player.all.each.with_index do |player, i|
      puts "#{i+1}. #{player.name} - #{player.country} - age: #{player.age}"
    end
    puts ""
  end

end
