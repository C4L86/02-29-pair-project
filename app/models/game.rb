Game class is responsible for the games table in the spielbound_search database.
#
#
#Returns an ActiveRecord relation containing all matches with the search parameters. 
class Game < ActiveRecord::Base
  def smart_search_title
    params["title"] = title_params
    if title_params.blank?
      title = ""
    else
      title = "title='#{title_params}' AND "
    end
  end

  def smart_search_age_group
    params["age_group"] = age_group_params
    if age_group_params.blank?
      age_group = ""
    else
      age_group = "age_group >= #{age_group_params} AND "
    end
  end

  def smart_search_min_players
    params["min_players"] = min_players_params
    if min_players_params.blank?
      min_players = ""
    else
      min_players = "min_players >= #{min_players_params} AND "
    end
  end

  def smart_search_max_players
    params["max_players"] = max_players_params
    if max_players_params.blank?
      max_players = ""
    else
      max_players = "max_players <= #{max_players_params} AND "
    end
  end

  def smart_search_play_time
    params["play_time"] = play_time_params
    if play_time_params.blank?
      max_playtime = ""
    else
      max_playtime = "max_playtime <= #{play_time_params} AND "
    end
  end

  def game_object_finder
    search_string = (title + age_group + min_players + max_players + max_playtime).chomp(" AND ")

    Game.where(search_string)
  end

  def self.smart_search(params)

    smart_search_title(params)

    smart_search_age_group(params)

    smart_search_min_players(params)

    smart_search_max_players(params)

    smart_search_play_time(params)

    game_object_finder
  end  
end