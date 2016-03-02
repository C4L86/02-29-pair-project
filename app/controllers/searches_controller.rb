MyApp.get "/" do
  
  erb :"/user/game_search"
end

MyApp.post "/process_game_search" do
  @games = Game.all

  game_arr = params.values

  
  @game = Game.where({"title" => game_arr[0]}) || Game.where({"genre" => game_arr[1]}) || Game.where({"age_group" => game_arr[2]}) || Game.where({"min_players" => game_arr[3]}) || Game.where({"max_players" => game_arr[4]}) || Game.where({"play_time" => game_arr[5]})
  binding.pry
  erb :"/user/game_search_result"
end