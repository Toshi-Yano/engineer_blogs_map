$(function() {
  $(document).on('turbolinks:load', ()=> {

    function showBlog(blog) {
      let html = `
        <div>
          <span class="myblog__main__form--result-title">${blog.title}</span>
          <p class="myblog__main__form--result-text">上記のブログで間違いなければ登録ボタンを押して下さい。</p>
        </div>
        `;
        $("#myblog__main__form--result").append(html);
    }

    function showNoBlog() {
      let html = `
        <p class="myblog__main__form--result-text">一致するブログが見つかりませんでした。</p>
        <p class="myblog__main__form--result-text">ブログの共有がお済みでない場合は共有後に登録して下さい。</p>
        `;
        $("#myblog__main__form--result").append(html);
    }

    // フォームに入力されたURLからブログデータを検索
    $(".myblog__main__form--input").on("input", function() {
      let input = $(".myblog__main__form--input").val();
      $.ajax({
        type: "GET",
        url: "/blogs/search_myblog",
        data: {keyword: input},
        dataType: "json"
      })
      .done(function(blogs){
        $(".myblog__main__form--result").empty();
        if (blogs.length !== 0) {
          blogs.forEach(function(blog) {
            showBlog(blog);
            // console.log(blog)
          });
        } else if (input.length == 0) {
          return false;
        } else {
          showNoBlog();
        }
      })
      .fail(function(){
        alert("通信エラーのためデータの表示ができません。")
      })
    });
  });
})