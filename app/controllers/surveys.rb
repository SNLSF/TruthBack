#Form to create new survey
get '/surveys/new' do
  @traits = Trait.all
  erb :'surveys/new'
end

#Assigning FB photo to user's photos and the selected trait to that photo
post '/surveys' do
  user_id = session[:user_id]
  current_user = User.find(user_id)
  @photo = Photo.where(url: params["photo_url"], user: current_user).first_or_initialize
  @photo.trait = Trait.find_by(word: params["trait"])
  @photo.save!
  redirect '/surveys'
end

#Show all users' surveys
get '/surveys' do
  user_id = session[:user_id]
  @current_user = User.find(user_id)
  @photos = Photo.where("user_id != #{@current_user.id}")
  @traits = Trait.all
  erb :'surveys/index'
end

#Show a specific survey's results
get '/surveys/results' do
  user_id = session[:user_id]
  @current_user = User.find(user_id)
  @photos = @current_user.photos

  erb :'surveys/results'
end

post '/surveys/complete' do
  @photo = Photo.where(url: params["photo_url"])
  user_id = session[:user_id]
  @current_user = User.find(user_id)
  # @selected_trait_id = params["trait"].id
  @trait = Trait.find_by(word: params["trait"])

  @answer = Answer.new(photo_id: @photo.first.id, user_id: @current_user.id, trait_id: @trait.id)
  @answer.save!

  @photo.first.answers.push(@answer)

  redirect '/surveys'
end

post '/surveyresults' do
  @photo = Photo.where(url: params["url"])
  @answers = Answer.where(photo_id: @photo.first.id)
  @traits = []
  @answers.each do |answer|
    @traits << answer.trait.word
  end
  @traits.to_json
  @result = Hash.new(0)
  @traits.each { |trait| @result[trait] += 1 }
  @result.to_json
end

#Destroy the survey
delete '/surveys/:id' do
end
