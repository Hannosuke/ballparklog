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
  onSelect: (dateText) => {
  var selectDate = new Date (dateText);
  var year = selectDate.getFullYear();
  var month = ("0" + (selectDate.getMonth() + 1)).slice(-2);
  var day = ("0" + (selectDate.getDate())).slice(-2); 
  var gameDate = `${year}-${month}-${day}`

  $.ajax({
    type: "GET",
    url: `/api/games`,
    data: { date: gameDate },
    dataType:"json",
  })

  .done((data) => {
    $(".game-select option").remove();
    $(data).each((i,game) => {
      $(".game-select").append(
        `<option value="${game.id}">${game.game_name}</option>`
      );
    });
  })
  }
})





//画像プレビュー
  $("#ballpark_log_image").on("change", (e) => {
    var file = e.target.files[0];
    var reader = new FileReader;
    if(file.type.indexOf("image")<0) {
      alert("画像ファイルを指定してください")
      return;
    }
    reader.onload = (function(file){
      return function(e){
        $("#preview").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file)
  });
  
  
//プロフィール画像プレビュー
  $("#user_image").on("change", (e) => {
    var file = e.target.files[0];
    var reader = new FileReader;
    if(file.type.indexOf("image")<0) {
      alert("画像ファイルを指定してください")
      return;
    }
    reader.onload = (function(file){
      return function(e){
        $("#icon_preview").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file)
  });











//いいねボタン
$(".like-btn").each( (i) => {
  $(`.like-btn:eq(${i})`).on("click", (event) => {
    event.preventDefault();
    var likeUserId = $(`.like-current-user-id`).val();
    var likeLogId = $(`.like-ballparklog-id:eq(${i})`).val();
    
    $.ajax({
      type: "POST",
      url: `/ballpark_logs/${likeLogId}/likes`,
      data: {
        like: {
          user_id: likeUserId,
          ballpark_log_id: likeLogId
        }
      }
    })
    
    .done(() => {
      $(`.like-btn:eq(${i})`).children("i").replaceWith('<i class="dislike-btn fas fa-thumbs-up text-primary"></i>');
      var likecount = $(`.like-btn:eq(${i})`).children("span").text();
      var likenum = Number( likecount );
      $(`.like-btn:eq(${i})`).children("span").replaceWith(`<span>${likenum + 1}</span>`)
    })
  })
});



//いいね取り消しボタン
$(".dislike-btn").each( (i) => {
  $(`.dislike-btn:eq(${i})`).on("click", (event) => {
    event.preventDefault();
    var likeUserId = $(`.dislike-current-user-id`).val();
    var likeLogId = $(`.dislike-ballparklog-id:eq(${i})`).val();
    
    $.ajax({
      type: "POST",
      url: `/ballpark_logs/${likeLogId}/like/${likeUserId}`,
      data: {
        like: {
          user_id: likeUserId,
          ballpark_log_id: likeLogId,
        }
      }
    })
    
    .done(() => {
      $(`.dislike-btn:eq(${i})`).children("i").replaceWith('<i class="like-btn far fa-thumbs-up"></i>');
      var likecount = $(`.dislike-btn:eq(${i})`).children("span").text();
      var likenum = Number( likecount );
      var likedcount = ( likenum - 1 );
      $(`.dislike-btn:eq(${i})`).children("span").replaceWith(`<span>${likedcount}</span>`)
    })
  })
});





// フラッシュ一定時間で消滅
$(function(){
  setTimeout("$('.time-limit').fadeOut('slow')",1500)
})





// ツールチップを初期化
$(() => {
  $('[data-toggle="tooltip"]').tooltip()
})




// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//= jquery
//= jquery_ujs