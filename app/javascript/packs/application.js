// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


//datepicer
$("#datepicker").datepicker({
  dateFormat: "yy-m-d",
  firstDay: 1,
  monthNames: [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月" ],
  showAnim: "fadeIn",


  //日付が変更された時のイベント設定
  onSelect: function(dateText) {
  var foo = new Date (dateText);
  var year = foo.getFullYear();
  var month = ("0" + (foo.getMonth() + 1)).slice(-2);
  var day = ("0" + (foo.getDate())).slice(-2);
  
  var piyo = `${year}-${month}-${day}`

  //ajax処理を記述  
  $.ajax({
    type: "GET",
    url: `/games/searches`,
    data: { date: piyo },
    dataType:"json",
  })

  //成功処理を記述
  .done(function(data) {
    $(data).each(function(i,game) {
      $(".game-select").append(
        `<option>${game.id}</option>`
      );
    });
  })
  .fail(function(){
    alert("失敗だよ");
  })
  }
})





//いいねボタン
$("#like_button").on("click", (event) => {
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
      $("#like_button").text("いいね済");
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