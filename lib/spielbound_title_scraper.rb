# 1. given some title, get the rest of the information needed from BGG

# 2. not having to manually provide all the titles. get a list of titles from spielbound, and loop through them, each time running #1 above on that title.

# 3. loop through all the titles you know above, run #1 on them, and each time #1 completes for a given title, save that to your database.

# fetch_game_info("Agricola")
# => ...

require "httparty"

def fetch_game_info(title)
  id = HTTParty.get("http://www.boardgamegeek.com/xmlapi/boardgame/#{title}")
  x  = HTTParty.get("http://www.boardgamegeek.com/xmlapi/boardgame/#{id}")
end

fetch_game_info("Agricola")

class GameDataScraper
  def titles
    return @titles
  end

  def fetch_titles
    @titles = []

# Go to SB site
    x = HTTParty.get("spielbound.com/library")
# look into their code

# identify the loop
# identify where the title is in the loop
# grab the title
# push the title into @titles Array
    @titles << title
  end
end

scraper = SpielboundTitleScraper.new
scraper.fetch_titles