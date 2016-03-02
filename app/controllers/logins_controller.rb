MyApp.post "/user_login_form" do
  @users = User.all
  @user  = User.find_by_email(params["email"])

  if @user.password == params["password"]
    session["user_id"] = @user.id
  end

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