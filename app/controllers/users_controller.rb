MyApp.get "/"  do
  
  erb :"/user/user_login"
end

MyApp.get "/user_create" do

  erb :"user/user_create"
end

MyApp.post "/user_create_form" do
  @user  = User.new

  @user.name     = params["name"]
  @user.email    = params["email"]
  @user.dob      = params["dob"]
  @user.password = params["password"]

  @user.save
  session["user_id"] = @user.id
  
  redirect "/game_search"
end

