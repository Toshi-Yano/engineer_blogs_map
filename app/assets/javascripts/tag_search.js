$(function() {
  $(document).on('turbolinks:load', ()=> {
    // ※追加するビュー・アクションが"tag.js"と一部異なるためこちらのファイルで管理
    // 追加するタグの一覧表示
    function addTagView(tag) {
      let html = `
        <div class="field__tag--each">
          <p class ="field__tag--each--name main__index__list--tag--partial search__field__tag--each--btn--add" data-tag-id="${tag.id}" data-tag-name="${tag.name}">${tag.name}</p>
        </div>
        `;
        $("#search-result__show").append(html);
    }
    // 追加候補が無かった場合の表示
    function addNoTagView() {
      let html = `
        <div class="field__tag--each">
          <p class ="field__tag--each--false">一致するタグが見つかりません</p>
        </div>
      `;
      $("#search-result__show").append(html);
    }
    // 選択済タグの一覧表示
    function addDeleteTag(name, id) {
      let html = `
        <div class="field__tag--each" id="${id}">
          <p class ="field__tag--each--name main__index__list--tag--partial search__field__tag--each--btn--remove" data-tag-id="${id}" data-tag-name="${name}">${name}</p>
        </div>
      `;
      $(".js-new-tags").append(html);
    }
    // 選択済のtagIdを配列のまま設定
    function addResultTag(tagIds) {
      let html = `<input value ="${tagIds}" name="q[tags_id_in]" type="hidden search" id="q_tags_id_in" />`; 
      $(".js-new-tags").append(html);
    }
    // Tagコントローラー・モデルを介して検索処理
    $("#search-form").on("keyup", function() {
      let input = $("#search-form").val();
      $.ajax({
        type: "GET",
        url: "/tags",
        data: {keyword: input},
        dataType: "json"
      })
      .done(function(tags){
        $("#search-result__show").empty();

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

    // ransackで使用する検索クエリを配列で作成
    let searchArray = []
    // タグがクリックされたらビューの入替えを行い、tagIdを配列へ挿入
    $(document).on("click touchstart", ".search__field__tag--each--btn--add", function() {
      const tagName = $(this).attr("data-tag-name");
      const tagId = $(this).attr("data-tag-id");
      $(this).parent().remove();
      addDeleteTag(tagName, tagId);
      $("#search-form").val("");
      return searchArray.push(tagId)
    });
    // 追加済のタグがクリックされたらビュー・配列内の値を削除
    $(document).on("click touchstart", ".search__field__tag--each--btn--remove", function() {
      let removeId = $(this).attr("data-tag-id");
      $(this).parent().remove();
      searchArray.some(function(value, i) {
        if (value == removeId) searchArray.splice(i,1);
        return searchArray
      })
    });
    // submitのタイミングでinput内容を設定
    $(document).on("click touchstart", "#search-submit", function() {
      addResultTag(searchArray)
    });
  });
})