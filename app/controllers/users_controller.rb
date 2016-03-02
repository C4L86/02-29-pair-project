MyApp.get "/"  do
  
  erb :"/user/user_login"
end

MyApp.get "/user_create" do

  erb :"user/user_create"
end

MyApp.post "/user_create_form" do
  @users = User.all
  @user  = User.new

  @user.name     = params["name"]
  @user.email    = params["email"]
  @user.dob      = params["dob"]
  @user.password = params["password"]

  @user.save
  session["user_id"] = @user.id
  
  redirect "/game_search"
end

MyApp.get "/user_profile" do
  @users = User.all
  @user = User.find_by_id(session["user_id"])

  erb :"/user/user_profile"
end

MyApp.get "/user_update" do
  @user = User.find_by_id(session["user_id"])

  erb :"/user/user_update_form"
end

MyApp.post "/process_user_update_form" do
  @user = User.find_by_id(session["user_id"])

  @user.name     = params["name"]
  @user.email    = params["email"]
  @user.dob      = params["dob"]
  @user.password = params["password"]

  @user.save
  session["user_id"] = @user.id

  redirect "/user_profile"
end

MyApp.get "/user_delete" do
  @user = User.find_by_id(session["user_id"])

  @user.delete

  redirect "/"
end