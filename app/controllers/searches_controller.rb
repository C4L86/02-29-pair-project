MyApp.get "/" do


  erb :"/user/game_search"
end

MyApp.post "/process_game_search" do
  @games = Game.all
  
  @search_hash = {}
  
  params.each do |key,value|
    if value != ""
      @search_hash[key] = value
    else
    end
  end

  @game = Game.where(@search_hash)

  erb :"/user/game_search_result"
end