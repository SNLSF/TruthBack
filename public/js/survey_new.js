

//In layout.erb we manually trigger the fb:loaded event when the fb SDK is created
$(document).on('fb:loaded', function() {
  //getLoginStatus won't run until everything is initialized
  //...so its callback won't fire until after the user has loaded
  //...which we need to wait for if we're hitting the api for our logged in user
  FB.getLoginStatus(function(response){
    //Get our albums
    FB.api('/me/albums', function(response) {
      //Loop through the albums
      $.each(response.data, function(i, album) {
        //Only use the Profile Pictures album
        if(album.name === 'Profile Pictures') {
          //Get all the photos from this album
          FB.api('/' + album.id + '/photos', function(response) {
            //Let's just grab the first photo at [0] for testing
            var photo = response.data[0].source;

            //Use this to inspect what the API is giving you back
            //console.log(response);

            $.each(response.data, function(i, photo) {
              $('.photos').append('<img class="photo" src="' + photo.picture + '" />');
            });
          });
        }
      });
    });
  });
});

$(document).on('click', '.photo', function(e) {
  var photo = $(e.target),
      photoUrl = photo.attr('src');

  $('.photo').removeClass('active');
  photo.addClass('active');

  $('input[name="photo_url"]').val(photoUrl);

});

