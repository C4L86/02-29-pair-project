MyApp.get "/"  do
  
  erb :"/user/user_login"
end

MyApp.post "/user_login_form" do
  @users = User.all
  @user  = User.find_by_email(params["email"])

  if @user.password == params["password"]
    session["user_id"] = @user.id
  end

  redirect "/game_search" 
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

MyApp.get "/logout_user/:user_id" do
  @user = User.find_by_id(params[:user_id])

  if @user.id == session["user_id"]
    session["user_id"] = nil
    redirect "/"
  
  else
    erb :"logins/logout_error"
  end
end