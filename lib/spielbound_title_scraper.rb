require "open-uri"

require_relative "../main.rb"

def fetch_game_info(title)
  begin
    bgg_data_for_title = HTTParty.get("http://boardgamegeek.com/xmlapi/search?search=#{title}&exact=1")

    if bgg_data_for_title["boardgames"] != nil && bgg_data_for_title["boardgames"]["boardgame"].is_a?(Hash)
      puts "Found one game for #{title}"

      id = bgg_data_for_title["boardgames"]["boardgame"]["objectid"]

      game_data = HTTParty.get("http://www.boardgamegeek.com/xmlapi/boardgame/#{id}")
      # binding.pry
      # game not on the site
      # multiple titles
      # missing column info
      # 
        @game = Game.new

        @game.title        = title
        @game.min_players  = game_data["boardgames"]["boardgame"]["minplayers"]
        @game.max_players  = game_data["boardgames"]["boardgame"]["maxplayers"]
        @game.min_playtime = game_data["boardgames"]["boardgame"]["minplaytime"]
        @game.max_playtime = game_data["boardgames"]["boardgame"]["maxplaytime"]
        @game.age_group    = game_data["boardgames"]["boardgame"]["age"]
        @game.description  = game_data["boardgames"]["boardgame"]["description"]
        @game.image        = game_data["boardgames"]["boardgame"]["image"]
        # @game.publisher    = game_data["boardgames"]["boardgame"]["boardgamepublisher"][0]["__content__"]
          # genre      = 
            
      @game.save
    else
      # binding.pry
      puts "ERROR"
      puts bgg_data_for_title["boardgames"]
    end
  rescue URI::InvalidURIError
    puts "Bad URL tried. Skipping... Tried #{title}"
  end
end

def fetch_titles_from_spielbound
  target = open("titles.txt", 'w')
  target.write("[")

  current_page = 1

  89.times do  
    doc = Nokogiri::HTML(open("http://spielbound.com/library?title=&field_playing_time_min__value=&&p=All&min=All&max=All&rating=All&sort_by=title&sort_order=ASC&page=#{current_page}"))

    doc.css("div.gamecard").each do |gamecard|
      target.write("\"")
      target.write(gamecard.css("h2.name a").text)
      target.write("\",")
      target.write("\n")
    end
    current_page += 1
  end

  target.write("]")
  target.close

  return nil
end

def populate_game_table
  x = [
    "Agricola",
    "Betrayal at House on the Hill",
    "Carcassonne",
    "Citadels",
    "CO₂",
    "Eclipse",
    "Hacienda",
    "Hanabi",
    "Stratego",
    "Toc Toc Woodman",
    "Tokaido",
    "Trains and Stations",
    "Trivial Pursuit",
    "Unexploded Cow",
    "Utopia",
    "Word on the Street",
    "Zombie Run!"
  ]

  x.each do |title|
    fetch_game_info(title)
  end
end