MyApp.get "/" do
  
  erb :"/user/game_search"
end

MyApp.post "/process_game_search" do
  @games = Game.all

  params
  binding.pry
  erb :"/user/game_search_result"
end