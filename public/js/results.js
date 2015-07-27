$(document).ready(function() {
  $('.survey-block').hide();

});

$(document).on('click', 'img', function(e) {
  e.preventDefault();
  var photo = $(e.target),
      photoUrl = photo.attr('src');

  $('.photo').removeClass('active');
  photo.addClass('active');
  $('img').not('.active').hide();
  $('.survey-block').show();
  $('input[name="photo_url"]').val(photoUrl);
  var selectedSurveyUrl = this.src

  $.ajax({
    url: "/surveyresults",
    type: "POST",
    data: {"url": selectedSurveyUrl}
  }).success(function(response) {
    var response = JSON.parse(response);

    if (response.value == undefined) {
      $('div.survey-block').append( "<p>No one has taken your survey yet!</p>" );
    };

    for (var value in response) {
      $('div.survey-block').append( "<p>"+ value +"</p>" );
      $('div.survey-block').append( "<p>"+ response[value] +"</p>" );
    }
  }).fail(function() {
    alert("Request failed");
  });

});
