$(document).ready(function () {

  $('#new_survey').on("submit", function (event) {
    console.log("HEY");

    event.preventDefault();

    var request = $.ajax(
      {url: "/surveys/new",
        type: "post",
        data: $(this).serialize(),
        dataType: "json"}
    );

    request.done(function (result) {
      $('#small_button').css("display", "none");
      $('#new_survey').css("display", "none");
      $('#create_survey_div').append("Success!");
    });
  });
});
