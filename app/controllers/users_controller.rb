MyApp.get "/"  do
  
  erb :"/user/user_login"
end

MyApp.get "/new_user" do


  erb :"user/new_user"
end

MyApp.post "/new_user_form" do

  @user  = User.new

  @user.name     = params["name"]
  @user.email    = params["email"]
  @user.password = params["password"]
  @user.dob      = params["dob"]

  @user.save
  session["user_id"] = @user.id
  redirect "/game_search"
end

