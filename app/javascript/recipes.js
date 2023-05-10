$("#recipe-list > li").on("click", function () {
  $("#recipe-list > li").removeClass("active");
  $(this).addClass("active");

  const id = $(this).attr("id");
  $.ajax({
    url: "/recipes/" + id,
    type: "GET",
    success: function (data) {
      $("#recipe-details").html(data);
    },
  });
});
