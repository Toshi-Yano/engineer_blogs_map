$(document).on("click", ".header__menu-icon", function() {
  $(this).attr("id", "hidden");
  // $(".header__contents, .header__close-icon, .body-cover").attr("id", "show");
  $(".body-cover").attr("id", "show");
});

$(document).on("click", "header__close-icon, .body-cover", function() {
  $(".body-cover").attr("id", "hidden");
  $(".header__menu-icon").attr("id", "show");
});