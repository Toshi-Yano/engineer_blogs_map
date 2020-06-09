$(function() {
  $(document).on('turbolinks:load', ()=> {

    const pageCount = 1 // トップページのコンテンツ数 - 1
    
    $(document).on("click touchend", "#top-right-arrow", function() {
      const currentPage = $("#show-index").data("index");
      const nextPage = currentPage + 1;

      $(".main__index__list").removeAttr("id", "show-index")
      if (nextPage > pageCount) {
        $('[data-index = 0]').attr("id", "show-index");
      } else {
        $('[data-index="' + nextPage + '"]').attr("id", "show-index");
      };
    });

    $(document).on("click touchend", "#top-left-arrow", function() {
      const currentPage = $("#show-index").data("index");
      const previousPage = currentPage - 1;

      $(".main__index__list").removeAttr("id", "show-index")
      if (previousPage < 0 ) {
        $('[data-index="' + pageCount + '"]').attr("id", "show-index");
      } else {
        $('[data-index="' + previousPage + '"]').attr("id", "show-index");
      };
    });

  });
})