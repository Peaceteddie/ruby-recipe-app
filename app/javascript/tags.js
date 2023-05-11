$("#recipe-list > li").on("click", function () {
  const recipeName = $("#recipe-name");

  if ($(this).hasClass("active")) {
    recipeName.removeClass("bg-primary");
    $(this).removeClass("active");
    recipeName.html("");
    return;
  }

  $("#recipe-list > li").removeClass("active");
  recipeName.addClass("bg-primary");
  recipeName.html($(this).html());
  $(this).addClass("active");

  $.ajax({
    url: "tags/recipe/" + $(this).attr("id"),
    type: "GET",
    success: function (data) {
      $("#recipe-tags").html(data);
    },
  });
});
