class Game < ActiveRecord::Base
  def search
    if params["title"].present? || params["genre"].present? || params["age_group"].present? || params["min_players"].present? || params["max_players"].present? || params["play_time"].present?
      
      game = Game.where("title" => params["title"], "genre" => params["genre"], "age_group" => params["age_group"], "min_players" => params["min_players"], "max_players" => params["max_players"], "play_time" =>params["play_time"])
    end
    return game
  end
end