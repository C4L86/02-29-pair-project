MyApp.get "/" do
  
  erb :"/user/game_search"
end

MyApp.post "/process_game_search" do
  @games = Game.all
<<<<<<< HEAD
  
  search_hash = {}
  
  params.each do |key,value|
    if value != ""
      search_hash[key] = value
    else
    end
  end
  
  @game = Game.where(search_hash)

=======

  game_arr = params.values

  
  @game = Game.where({"title" => game_arr[0]})
  binding.pry
>>>>>>> master
  erb :"/user/game_search_result"
end