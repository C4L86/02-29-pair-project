
# 1. given some title, get the rest of the information needed from BGG

# 2. not having to manually provide all the titles. get a list of titles from spielbound, and loop through them, each time running #1 above on that title.

# 3. loop through all the titles you know above, run #1 on them, and each time #1 completes for a given title, save that to your database.

# fetch_game_info("Agricola")
# => ...
require "open-uri"

require_relative "../main.rb"

def fetch_game_info(title)
  @game = Game.new
  
  bgg_data_for_title = HTTParty.get("http://boardgamegeek.com/xmlapi/search?search=#{title}")

  id = bgg_data_for_title["boardgames"]["boardgame"][0]["objectid"]

  game_data = HTTParty.get("http://www.boardgamegeek.com/xmlapi/boardgame/#{id}")

  # game not on the site
  # multiple titles
  # missing column info
  # 
  # if game_data["boardgames"]["boardgame"]["name"][0]["__content__"] == nil
  @game.title        = game_data["boardgames"]["boardgame"]["name"][0]["__content__"]
  @game.min_players  = game_data["boardgames"]["boardgame"]["minplayers"]
  @game.max_players  = game_data["boardgames"]["boardgame"]["maxplayers"]
  @game.min_playtime = game_data["boardgames"]["boardgame"]["minplaytime"]
  @game.max_playtime = game_data["boardgames"]["boardgame"]["maxplaytime"]
  @game.age_group    = game_data["boardgames"]["boardgame"]["age"]
  @game.description  = game_data["boardgames"]["boardgame"]["description"]
  @game.image        = game_data["boardgames"]["boardgame"]["image"]
  @game.publisher    = game_data["boardgames"]["boardgame"]["boardgamepublisher"][0]["__content__"]
      # genre      = 


  @game.save
end

# puts fetch_game_info("Monopoly")

# def fetch_titles_from_spielbound
#   title_arr = []
#   current_page = 1


#   89.times do  
#     doc = Nokogiri::HTML(open("http://spielbound.com/library?title=&field_playing_time_min__value=&&p=All&min=All&max=All&rating=All&sort_by=title&sort_order=ASC&page=#{current_page}"))

#     doc.css("div.gamecard").each do |gamecard|
#       title_arr << gamecard.css("h2.name a").text
#     end
#     current_page += 1
#   end

#   return title_arr
# end
def populate_game_table
  fake_game_arr = ["Monopoly","Agricola","Risk Legacy"]

  fake_game_arr.each do |title|
    fetch_game_info(title)
  end
end

populate_game_table



