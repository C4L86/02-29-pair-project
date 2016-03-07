require "open-uri"

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