# Service to connect with the BoardGameGeek API.
class BoardGameGeek
  def initialize(title)
    @title = title
  end

  def create_game(game_data)
    @game = Game.new

    @game.title        = @title
    @game.min_players  = game_data["boardgames"]["boardgame"]["minplayers"]
    @game.max_players  = game_data["boardgames"]["boardgame"]["maxplayers"]
    @game.min_playtime = game_data["boardgames"]["boardgame"]["minplaytime"]
    @game.max_playtime = game_data["boardgames"]["boardgame"]["maxplaytime"]
    @game.age_group    = game_data["boardgames"]["boardgame"]["age"]
    @game.description  = game_data["boardgames"]["boardgame"]["description"]
    @game.image        = game_data["boardgames"]["boardgame"]["image"]

    @game.save
  end

  def bgg_data_for_title
    HTTParty.get("http://boardgamegeek.com/xmlapi/search?search=#{@title}&exact=1")
  end

  def id
    bgg_data_for_title["boardgames"]["boardgame"]["objectid"]
  end

  def game_found?
    bgg_data_for_title["boardgames"] != nil && bgg_data_for_title["boardgames"]["boardgame"].is_a?(Hash)
  end

  def game_data
    HTTParty.get("http://www.boardgamegeek.com/xmlapi/boardgame/#{id}")
  end

  def fetch_game_info
    begin
      if game_found?
        puts "Found one game for #{@title}"

        create_game(game_data)
      else
        puts "ERROR"
        puts bgg_data_for_title["boardgames"]
      end
    rescue URI::InvalidURIError
      puts "Bad URL tried. Skipping... Tried #{@title}"
    end
  end
end