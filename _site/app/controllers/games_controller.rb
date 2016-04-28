MyApp.get "/game_create" do
  @games = Game.all
  @user  = User.find_by_id(session["user_id"])

  erb :"admin/game_create"
end

MyApp.post "/process_game_create" do
  @games = Game.all
  @game  = Game.new
  @game.create_and_update_game(params)

  # @game.title        = params["title"]
  # @game.genre        = params["genre"]
  # @game.age_group    = params["age_group"].to_i
  # @game.min_players  = params["min_players"].to_i
  # @game.max_players  = params["max_players"].to_i
  # @game.description  = params["description"]
  # @game.min_playtime = params["min_playtime"].to_i
  # @game.max_playtime = params["max_playtime"].to_i
  # @game.publisher    = params["publisher"]
  # @game.price        = params["price"].to_f

  # @game.save

  redirect "/game_create"
end

MyApp.get "/game_library" do
  @games = Game.all
  @user  = User.find_by_id(session["user_id"])

  erb :"/admin/game_library"
end

MyApp.get "/game_profile/:game_id" do
  @game  = Game.find_by_id(params[:game_id])
  @user  = User.find_by_id(session["user_id"])

  erb :"/admin/game_profile"
end

MyApp.get "/game_update/:game_id" do
  @games = Game.all
  @game  = Game.find_by_id(params[:game_id])

  erb :"/admin/game_update"
end

MyApp.post "/process_game_update/:game_id" do
  @games = Game.all
  @game =  Game.find_by_id(params[:game_id])
  @game.create_and_update_game(params)

  # @game.title        = params["title"]
  # @game.genre        = params["genre"]
  # @game.age_group    = params["age_group"].to_i
  # @game.min_players  = params["min_players"].to_i
  # @game.max_players  = params["max_players"].to_i
  # @game.description  = params["description"]
  # @game.min_playtime = params["min_playtime"].to_i
  # @game.max_playtime = params["max_playtime"].to_i
  # @game.publisher    = params["publisher"]
  # @game.price        = params["price"].to_f

  # @game.save

  redirect "/game_library"
end

MyApp.get "/games_delete/:game_id" do
  @game = Game.find_by_id(params[:game_id])

  @game.delete

  redirect "/game_library"
end