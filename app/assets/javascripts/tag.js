$(function() {
  $(document).on('turbolinks:load', ()=> {
    // 追加するタグの一覧表示
    function addTagView(tag) {
      let html = `
        <div class="field__tag--each">
          <p class ="field__tag--each--name main__index__list--tag--partial field__tag--each--btn--add" data-tag-id="${tag.id}" data-tag-name="${tag.name}">${tag.name}</p>
        </div>
        `;
        $("#search-result").append(html);
    }
    // 追加候補が無かった場合の表示
    function addNoTagView() {
      let html = `
        <div class="field__tag--each">
          <p class ="field__tag--each--false">一致するタグが見つかりません</p>
        </div>
      `;
      $("#search-result").append(html);
    }
    // 選択済タグの一覧表示
    function addDeleteTag(name, id) {
      let html = `
        <div class="field__tag--each" id="${id}">
          <p class ="field__tag--each--name main__index__list--tag--partial field__tag--each--btn--remove" data-tag-id="${id}" data-tag-name="${name}">${name}</p>
        </div>
      `;
      $(".js-new-tags").append(html);
    }
    // 上記で設定した個々のタグへinput内容を追加
    function addCreateTag(id) {
      let html = `<input value ="${id}" name="blog[tag_ids][]" type="hidden" id="blog_tag_ids_${id}" />`; 
      $(`#${id}`).append(html);
    }

    // Tagコントローラー・モデルを介して検索処理
    $("#tag-form").on("keyup", function() {
      let input = $("#tag-form").val();
      $.ajax({
        type: "GET",
        url: "/tags",
        data: {keyword: input},
        dataType: "json"
      })
      .done(function(tags){
        $("#search-result").empty();
        if (tags.length !== 0) {
          tags.forEach(function(tag) {
            addTagView(tag);
          });
        } else if (input.length == 0) {
          return false;
        } else {
          addNoTagView();
        }
      })
      .fail(function(){
        alert("通信エラーのためタグの表示ができません。")
      });
    });

    // タグがクリックされたらビューの入替え・valueの設定を行う
    $(document).on("click touchstart", ".field__tag--each--btn--add", function() {
      const tagName = $(this).attr("data-tag-name");
      const tagId = $(this).attr("data-tag-id");
      $(this).parent().remove();
      addDeleteTag(tagName, tagId);
      addCreateTag(tagId);
      $("#tag-form").val("");
    });
    // 追加済のタグがクリックされたら削除
    $(document).on("click touchstart", ".field__tag--each--btn--remove", function() {
      $(this).parent().remove();
    });
  });
})