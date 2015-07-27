# // Trying to create new Photo objects for each image on the page assigned to the current user so that when we create the "survey" or PhotosTraits object, it will have a photo id and user id
# // var current_user = User.find_by(id: session[:user_id]);
# // var current_user_id = current_user.id;
# // var images = $('img');
# // for (var i = 0; i > images.length; i++) {
# //   Photo.create(user_id: current_user_id, url: i.src);