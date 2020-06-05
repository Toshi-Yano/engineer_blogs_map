$(document).on("click", ".header__menu-icon", function() {
  $(this).attr("id", "hidden");
  $(".body-cover").attr("id", "show");
  $(".top-menu__contents").attr("id", "show-flex")
  $("body").attr("id", "no-scroll")
  $(".header__close-icon").attr("id", "show")
});

$(document).on("click", ".header__close-icon, .body-cover", function() {
  $(".body-cover").attr("id", "hidden");
  $(".top-menu__contents").attr("id", "hidden");
  $("body").removeAttr("id", "no-scroll")
  $(".header__menu-icon").attr("id", "show");
});