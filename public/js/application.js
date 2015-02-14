$(document).ready(function () {

  $('#submit').submit(function (event) {

    event.preventDefault();

    var request = $.ajax(
      {url: "/surveys",
        method: "post"}
    );

    request.done(function (result) {
      $('#submit').append("Success! created " + result);
    });
  });
});
