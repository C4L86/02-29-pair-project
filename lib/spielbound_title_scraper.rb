# 1. given some title, get the rest of the information needed from BGG

# 2. not having to manually provide all the titles. get a list of titles from spielbound, and loop through them, each time running #1 above on that title.

# 3. loop through all the titles you know above, run #1 on them, and each time #1 completes for a given title, save that to your database.

# fetch_game_info("Agricola")
# => ...

require "httparty"
require "Nokogiri"

# def fetch_game_info(title)
#   bgg_data_for_title = HTTParty.get("http://boardgamegeek.com/xmlapi/search?search=#{title}")

#   id = bgg_data_for_title["boardgames"]["boardgame"][0]["objectid"]

#   game_data = HTTParty.get("http://www.boardgamegeek.com/xmlapi/boardgame/#{id}")

#   title        = game_data["boardgames"]["boardgame"]["name"][0]["__content__"]
#   min_players  = game_data["boardgames"]["boardgame"]["minplayers"]
#   max_players  = game_data["boardgames"]["boardgame"]["maxplayers"]
#   min_playtime = game_data["boardgames"]["boardgame"]["minplaytime"]
#   max_playtime = game_data["boardgames"]["boardgame"]["maxplaytime"]
#   age_group    = game_data["boardgames"]["boardgame"]["age"]
#   description  = game_data["boardgames"]["boardgame"]["description"]
#   image        = game_data["boardgames"]["boardgame"]["image"]
#   publisher    = game_data["boardgames"]["boardgame"]["boardgamepublisher"][0]["__content__"]

#   # genre      = 
# end

# puts fetch_game_info("Agricola")

def fetch_titles_from_spielbound
  title = []
  current_page = 1
  url = "http://spielbound.com/library?title=&field_playing_time_min__value=&&p=All&min=All&max=All&rating=All&sort_by=title&sort_order=ASC&page=#{current_page}"

  while (url) do  
    doc = Nokogiri::HTML(open("http://spielbound.com/library?title=&field_playing_time_min__value=&&p=All&min=All&max=All&rating=All&sort_by=title&sort_order=ASC&page=#{current_page}"))

    doc.css("div.gamecard").each do |gamecard|
      title << gamecard.css("h2.name a").text
    end
    current_page += 1
  end

  return title
end

puts fetch_titles_from_spielbound