MyApp.get "/game_search" do
  @games = Game.all
  @game  = Game.where(@search_hash)
  @users = User.all
  @user  = User.find_by_id(session["user_id"])

  erb :"/user/game_search"
end

MyApp.post "/process_game_search" do
  @games = Game.all
  
  @game = Game.smart_search(params)

  erb :"/user/game_search_result"
end