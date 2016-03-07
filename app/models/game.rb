  #Game class is responsible for the games table in the spielbound_search database.  self.smart_search queries the games table based on user inputs. 
#
#
#Returns an ActiveRecord relation containing all matches with the search parameters. 

class Game < ActiveRecord::Base
  def self.smart_search(params)
    if params["title"].blank?
      title = ""
    else
      title = "title='#{params["title"]}' AND "
    end

    if params["age_group"].blank?
      age_group = ""
    else
      age_group = "age_group >= #{params["age_group"]} AND "
    end

    if params["min_players"].blank?
      min_players = ""
    else
      min_players = "min_players >= #{params["min_players"]} AND "
    end

    if params["max_players"].blank?
      max_players = ""
    else
      max_players = "max_players <= #{params["max_players"]} AND "
    end

    if params["play_time"].blank?
      max_playtime = ""
    else
      max_playtime = "max_playtime <= #{params["play_time"]} AND "
    end

    # binding.pry

    search_string = (title + age_group + min_players + max_players + max_playtime).chomp(" AND ")

    Game.where(search_string)
  end  

end