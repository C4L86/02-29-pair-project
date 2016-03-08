require "open-uri"

def fetch_titles_from_spielbound(num_pages)
  titles_file = open("titles.txt", 'w')

  current_page = 1

  while current_page <= num_pages do  
    doc = Nokogiri::HTML(open("http://spielbound.com/library?title=&field_playing_time_min__value=&&p=All&min=All&max=All&rating=All&sort_by=title&sort_order=ASC&page=#{current_page}"))

    doc.css("div.gamecard").each do |gamecard|
      titles_file.write(gamecard.css("h2.name a").text)
      titles_file.write("\n")
    end

    current_page += 1
  end

  titles_file.close

  return nil
end