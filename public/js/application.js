$(document).ready(function () {

  $('#new_survey').on("submit", function (event) {
    event.preventDefault();

    var request = $.ajax(
      {url: "/surveys/new",
        type: "post",
        data: $(this).serialize(),
        }
    );

    request.done(function (result) {
      $('#small_button').css("display", "none");
      $('#new_survey').css("display", "none");
      $('#create_survey_div').append("You've successfully created survey: " + result.survey.title);
      $("#add_question_div").toggle();
    });
  });

  $("#question_choice_form").on("submit", function(event){

    event.preventDefault();

    var request = $.ajax({
      url: "/questions/new",
      type: "POST",
      data: $(this).serialize(),
    });


    request.done(function (result) {
      $("#created_questions").append(result)
      $("#question_choice_form").each(function(){
        this.reset();
      });
    });
  });

});
