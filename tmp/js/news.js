/* news.js

   Cycle through news stories.  Depends on jquery.

   Evan Chang
*/
(function ($) {
  $.News = {};

  var current = $.News.current = 0;
  $.News.rotate = function () {
    var next = (current + 1) % $.News.num_items;
    $("div.news-item:eq(" + current + ")").animate({opacity: $.News.initial_opacity}, "slow");
    $("div.news-detail:eq(" + current + ")").animate({opacity: 0}, "slow").hide();
    $("div.news-item:eq(" + next + ")").animate({opacity: 1}, "slow");
    $("div.news-detail:eq(" + next + ")").show().animate({opacity: 1}, "slow");
    current = $.News.current = next;
  }
})(jQuery);

$(document).ready(function () {
  var num_items = $.News.num_items = $("div.news-item").size();
  if (num_items > 0) {
    $.News.initial_opacity = $("div.news-item").css("opacity");

    $("div.news-item:first").animate({opacity: 1}, "slow");
    $("div.news-detail:first").show().animate({opacity: 1}, "slow");

    var item_time_ms = 8000;
    var news_interval = setInterval($.News.rotate, item_time_ms);

    $("#news-box").hover(
      function () { clearInterval(news_interval); }
    ,
      function () {
        news_interval = setInterval($.News.rotate, item_time_ms);
        $.News.rotate();
      }
    );

    $("#news-box").click(
      function () {
        clearInterval(news_interval);
        var item_id = $("div.news-item:eq(" + $.News.current + ")").attr("id");
        window.location = "news.html#" + item_id;
      }
    );
 }
});
