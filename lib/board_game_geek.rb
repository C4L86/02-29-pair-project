def create_game(title, game_data)
  @game = Game.new

  @game.title        = title
  @game.min_players  = game_data["boardgames"]["boardgame"]["minplayers"]
  @game.max_players  = game_data["boardgames"]["boardgame"]["maxplayers"]
  @game.min_playtime = game_data["boardgames"]["boardgame"]["minplaytime"]
  @game.max_playtime = game_data["boardgames"]["boardgame"]["maxplaytime"]
  @game.age_group    = game_data["boardgames"]["boardgame"]["age"]
  @game.description  = game_data["boardgames"]["boardgame"]["description"]
  @game.image        = game_data["boardgames"]["boardgame"]["image"]

  @game.save
end

def bgg_data_for_title(title)
  HTTParty.get("http://boardgamegeek.com/xmlapi/search?search=#{title}&exact=1")
end

def fetch_game_info(title)
  begin
    if bgg_data_for_title(title)["boardgames"] != nil && bgg_data_for_title(title)["boardgames"]["boardgame"].is_a?(Hash)
      puts "Found one game for #{title}"

      id = bgg_data_for_title(title)["boardgames"]["boardgame"]["objectid"]

      game_data = HTTParty.get("http://www.boardgamegeek.com/xmlapi/boardgame/#{id}")

      create_game(title, game_data)
    else
      puts "ERROR"
      puts bgg_data_for_title(title)["boardgames"]
    end
  rescue URI::InvalidURIError
    puts "Bad URL tried. Skipping... Tried #{title}"
  end
end