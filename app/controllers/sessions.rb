post '/sessions' do
  #If sign in with Facebook fails, user goes back to index
  @current_user = User.find_by(email: params[:email])
  if @current_user
    session[:user_id] = @current_user.id
    redirect "/users/#{@current_user.id}"
  else
    redirect '/'
  end
end

delete '/sessions/:id' do
  session[:user_id]=nil
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end
