MyApp.get "/game_create" do
  @user  = User.find_by_id(session["user_id"])

  erb :"admin/game_create"
end

MyApp.post "/process_add_games" do
  @game = Game.new

  @game.title       = params["title"]
  @game.genre       = params["genre"]
  @game.age_group   = params["age_group"].to_i
  @game.min_players = params["min_players"].to_i
  @game.max_players = params["max_players"].to_i
  @game.description = params["description"]
  @game.play_time   = params["play_time"].to_i
  @game.publisher   = params["publisher"]
  @game.price       = params["price"].to_f

  @game.save

  redirect "/game_create"
end

MyApp.get "/index" do
  @games = Game.all
  @user  = User.find_by_id(session["user_id"])

  erb :"/admin/index"
end

MyApp.get "/game_update/:game_id" do
  @games = Game.all
  @game  = Game.find_by_id(params[:game_id])

  erb :"/admin/game_update"
end

MyApp.post "/process_game_update/:game_id" do
  @games = Game.all
  @game =  Game.find_by_id(params[:game_id])

  @game.title       = params["title"]
  @game.genre       = params["genre"]
  @game.age_group   = params["age_group"].to_i
  @game.min_players = params["min_players"].to_i
  @game.max_players = params["max_players"].to_i
  @game.description = params["description"]
  @game.play_time   = params["play_time"].to_i
  @game.publisher   = params["publisher"]
  @game.price       = params["price"].to_f

  @game.save

  redirect "/index"
end

MyApp.get "/games_delete/:game_id" do
  @game = Game.find_by_id(params[:game_id])

  @game.delete

  redirect "/index"
end