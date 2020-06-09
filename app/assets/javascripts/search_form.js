$(function() {
  $(document).on('turbolinks:load', ()=> {

    $(document).on("click touchend", ".search__left-js", function() {
      $(".search__left").toggleClass("hidden--md");
    });
  });
})