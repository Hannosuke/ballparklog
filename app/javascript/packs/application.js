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
        $('.edit-img').remove();
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




// フラッシュ一定時間で消滅
$(() => {
  setTimeout("$('.time-limit').fadeOut('slow')",1500)
});





// ツールチップを初期化
$(() => {
  $('[data-toggle="tooltip"]').tooltip()
});









(function ($) {
  "use strict"; // Start of use strict

  // Smooth scrolling using jQuery easing
  $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function () {
      if (
          location.pathname.replace(/^\//, "") ==
              this.pathname.replace(/^\//, "") &&
          location.hostname == this.hostname
      ) {
          var target = $(this.hash);
          target = target.length
              ? target
              : $("[name=" + this.hash.slice(1) + "]");
          if (target.length) {
              $("html, body").animate(
                  {
                      scrollTop: target.offset().top - 72,
                  },
                  1000,
                  "easeInOutExpo"
              );
              return false;
          }
      }
  });

  // Closes responsive menu when a scroll trigger link is clicked
  $(".js-scroll-trigger").click(function () {
      $(".navbar-collapse").collapse("hide");
  });

  // Activate scrollspy to add active class to navbar items on scroll
  $("body").scrollspy({
      target: "#mainNav",
      offset: 74,
  });

  // Collapse Navbar
  var navbarCollapse = function () {
      if ($("#mainNav").offset().top > 100) {
          $("#mainNav").addClass("navbar-shrink");
      } else {
          $("#mainNav").removeClass("navbar-shrink");
      }
  };
  // Collapse now if page is not at top
  navbarCollapse();
  // Collapse the navbar when page is scrolled
  $(window).scroll(navbarCollapse);
})(jQuery); // End of use strict

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//= jquery
//= jquery_ujs