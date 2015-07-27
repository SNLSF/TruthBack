get '/auth/:provider/callback' do
  #Create new User via omniauth Facebook, begin session, and send to user's homepage
  @user = User.where(email: env["omniauth.auth"]["info"]["email"]).first

  ## STUFF
  facebook_id = env['omniauth.auth']['uid']
  token = env['omniauth.auth']['credentials']['token']
  results = env["omniauth.strategy"].client.request(:get, "/v2.3/#{facebook_id}/photos?access_token=#{token}")

  if @user == nil
    @user = User.create(name: env["omniauth.auth"]["info"]["name"], email: env["omniauth.auth"]["info"]["email"])
  end
  session[:user_id] = @user.id
  redirect "users/#{@user.id}"
end

post '/users' do
  #Writes the user to the server and redirects to the home page after creating new user
  user = User.new(params[:user])
  if user.save
    session[:user_id]= user.id
  else
    redirect '/users/new'
  end
  redirect "/users/#{user.id}"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
