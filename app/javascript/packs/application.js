// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


$("#like_button").on("click", (event) => {
    debugger;
    event.preventDefault();
    // TODO: user_idを取得する
    var hoge = $(".current-user-id").val();
    // TODO: ballpark_log_idを取得する
    var fuga = $(".ballparklog-id").val();

    // TODO: Ajax処理を書く 参考 http://semooh.jp/jquery/api/ajax/jQuery.ajax/options/
    $.ajax({
      type: "POST",
      url: `/ballpark_logs/${fuga}/likes`,
      data: {
        like: {
          user_id: hoge,
          ballpark_log_id: fuga
        }
      }
    })
    // TODO: リクエストに成功した場合にいいねボタンに色をつけ、数字を変更する処理を書く
    .done(function(res) {
       $('ul').append(`<li class="list-group-item">
         <p class="card-title">${res.user_id}</p>
      </li>`);
    })
  })
  
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//= jquery
//= jquery_ujs