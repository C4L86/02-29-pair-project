#Game class is responsible for the games table in the spielbound_search database.
#
#
#Returns an ActiveRecord relation containing all matches with the search parameters. 
class Game < ActiveRecord::Base

def create_and_update_game(params)

    self.title        = params["title"]
    self.genre        = params["genre"]
    self.age_group    = params["age_group"].to_i
    self.min_players  = params["min_players"].to_i
    self.max_players  = params["max_players"].to_i
    self.description  = params["description"]
    self.min_playtime = params["min_playtime"].to_i
    self.max_playtime = params["max_playtime"].to_i
    self.publisher    = params["publisher"]
    self.price        = params["price"].to_f

    self.save
  end #end of create and update game method







  def self.smart_search_title(params)
    title_params = params
    
    if title_params.blank?
      @title = ""
    else
      @title = "title = '#{title_params}' AND "
    end
  end

  def self.smart_search_age_group(params)
    age_group_params = params
    if age_group_params.blank?
      @age_group = ""
    else
      @age_group = "age_group >= #{age_group_params} AND "
    end
  end

  def self.smart_search_min_players(params)
    min_players_params = params
    if min_players_params.blank?
      @min_players = ""
    else
      @min_players = "min_players >= #{min_players_params} AND "
    end
  end

  def self.smart_search_max_players(params)
    max_players_params = params
    if max_players_params.blank?
      @max_players = ""
    else
      @max_players = "max_players <= #{max_players_params} AND "
    end
  end

  def self.smart_search_play_time(params)
    play_time_params = params
    if play_time_params.blank?
      @max_playtime = ""
    else
      @max_playtime = "max_playtime <= #{play_time_params} AND "
    end
  end

  def self.game_object_finder
    search_string = (@title + @age_group + @min_players + @max_players + @max_playtime).chomp(" AND ")

    Game.where(search_string)
  end

  def self.smart_search(params)
    
    self.smart_search_title(params["title"])
    
    self.smart_search_age_group(params["age_group"])

    self.smart_search_min_players(params["min_players"])

    self.smart_search_max_players(params["max_players"])

    self.smart_search_play_time(params["play_time"])

    self.game_object_finder
  end  

  


end #end of game class

  






