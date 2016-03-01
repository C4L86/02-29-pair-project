MyApp.get "/" do
  
  erb :"/user/game_search"
end

MyApp.post "/process_game_search" do
  @games = Game.all

  game_arr = params.values

  
  @game = Game.where({"title" => game_arr[0]})
  binding.pry
  erb :"/user/game_search_result"
end