$(function() {
  $(document).on('turbolinks:load', ()=> {

    let eventType = window.ontouchend ? "click" : "touchend";

    $(document).on(eventType, ".header__menu-icon", function() {
      $(this).attr("id", "hidden");
      $(".body-cover").attr("id", "show");
      $(".top-menu__contents").attr("id", "show-flex")
      $("body").attr("id", "no-scroll")
      $(".header__close-icon").attr("id", "show")
    });

    $(document).on(eventType, ".top-menu__contents__close, .body-cover", function() {
      $(".body-cover").attr("id", "hidden");
      $(".top-menu__contents").attr("id", "hidden");
      $("body").removeAttr("id", "no-scroll")
      $(".header__menu-icon").attr("id", "show");
    });
  });
})