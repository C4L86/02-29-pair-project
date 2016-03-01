MyApp.get "/games_new" do

  erb :"admin/games_new"
end

MyApp.post "/process_add_games" do
  @game = Game.new

  @game.title = params["title"]
  @game.genre = params["genre"]
  @game.age_group = params["age_group"].to_i
  @game.min_players = params["min_players"].to_i
  @game.max_players = params["max_players"].to_i
  @game.description = params["description"]
  @game.play_time = params["play_time"].to_i
  @game.publisher = params["publisher"]
  @game.price = params["price"].to_f

  @game.save

  redirect "/games_new"
end

MyApp.get "/index" do
  @games = Game.all

  erb :"/admin/index"
end