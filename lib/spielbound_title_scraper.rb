# 1. given some title, get the rest of the information needed from BGG

# 2. not having to manually provide all the titles. get a list of titles from spielbound, and loop through them, each time running #1 above on that title.

# 3. loop through all the titles you know above, run #1 on them, and each time #1 completes for a given title, save that to your database.

# fetch_game_info("Agricola")
# => ...

require "httparty"

def fetch_game_info(title)
  bgg_data_for_title = HTTParty.get("http://boardgamegeek.com/xmlapi/search?search=#{title}")

  id = bgg_data_for_title["boardgames"]["boardgame"][0]["objectid"]

  game_data = HTTParty.get("http://www.boardgamegeek.com/xmlapi/boardgame/#{id}")

  title        = game_data["boardgames"]["boardgame"]["name"][0]["__content__"]
  min_players  = game_data["boardgames"]["boardgame"]["minplayers"]
  max_players  = game_data["boardgames"]["boardgame"]["maxplayers"]
  min_playtime = game_data["boardgames"]["boardgame"]["minplaytime"]
  max_playtime = game_data["boardgames"]["boardgame"]["maxplaytime"]
  age_group    = game_data["boardgames"]["boardgame"]["age"]
  description  = game_data["boardgames"]["boardgame"]["description"]
  image        = game_data["boardgames"]["boardgame"]["image"]
  publisher    = game_data["boardgames"]["boardgame"]["boardgamepublisher"][0]["__content__"]

  # genre      = 
end

# puts fetch_game_info("Agricola")

# class GameDataScraper
#   def titles
#     return @titles
#   end

#   def fetch_titles
#     @titles = []

#     current_page = 1
#     # Go to SB site
    # response = HTTParty.get("http://spielbound.com/library?title=&field_playing_time_min__value=&&p=All&min=All&max=All&rating=All&sort_by=title&sort_order=ASC&page=#{current_page}")

    # # search for div class="gamecard"
    # # within this div class, search for class="name"
    # # within that class, search for the href containing the title
    # # within that href, grab the title which is viewable to the user as the href button
    # response[<div class="gamecard">][<h2 class="name">][<a href="http://spielbound.com/game-title/GAME_TITLE">GAME_TITLE_TO_GRAB</a></h2>]
    # # grab that title
    # # push the title into @titles Array
    # @titles << title
    # # iterate 'current_page' up 1 to move to the next page
    # current_page += 1
    # loop through again until reaching the end of the final page
  end
end

# scraper = SpielboundTitleScraper.new
# scraper.fetch_titles