import { v4 as uuidv4 } from "uuid";

function remove_tag(id) {
  $.ajax({
    url: "editor/remove_tag",
    method: "DELETE",
    data: {
      id: id,
      authenticity_token: $('meta[name="csrf-token"]').attr("content"),
    },
    success: function (data) {
      $("#tags-container").html(data);
    },
  });
}

$(document).on("click", "#add-tag", function () {
  const tagInput = $("#tag-name").val();
  const guid = uuidv4();

  $.ajax({
    url: "editor/add_tag",
    method: "POST",
    data: {
      id: guid,
      name: tagInput,
      authenticity_token: $('meta[name="csrf-token"]').attr("content"),
    },
    success: function (data) {
      $("#tags-container").html(data);
      $("#tag-name").val("");
    },
  });
});

$(document).on("click", "#add-entry-button", function () {
  const nameInput = $("#name").val();
  const amountInput = $("#amount").val();
  const unitInput = $("#unit").val();
  const guid = uuidv4();

  $.ajax({
    url: "editor/create_entry",
    method: "POST",
    data: {
      id: guid,
      name: nameInput,
      amount: amountInput,
      unit: unitInput,
      authenticity_token: $('meta[name="csrf-token"]').attr("content"),
    },
    success: function (data) {
      $("#ingredients-container").html(data);
    },
  });
});

$(document).on("click", "#delete-entry-button", function () {
  const id = $(this).data("entryId");

  $.ajax({
    url: "editor/delete_entry",
    method: "DELETE",
    data: {
      id: id,
      authenticity_token: $('meta[name="csrf-token"]').attr("content"),
    },
    success: function (data) {
      $("#ingredients-container").html(data);
    },
  });
});
