$(document).ready(function() {
  $('.survey-block').hide();

});

$(document).on('click', 'img', function(e) {

  var photo = $(e.target),
      photoUrl = photo.attr('src');

  $('.photo').removeClass('active');
  photo.addClass('active');
  $('img').not('.active').hide();
  // $('img.active').css();
  $('.survey-block').show();
  $('input[name="photo_url"]').val(photoUrl);

});
