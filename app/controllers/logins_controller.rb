MyApp.post "/user_login_form" do
  @users = User.all
  @user  = User.find_by_email(params["email"])

  if @user.name == "admin" && @user.password == params["password"]
    session["user_id"] = @user.id
    redirect "/admin_home"

  elsif @user.password == params["password"]
    session["user_id"] = @user.id
    redirect "/game_search"
  end 
end

MyApp.get "/admin_home" do
  @user  = User.find_by_id(session["user_id"])

  erb :"/admin/admin_home"
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