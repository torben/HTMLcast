$(function() {
  $(".comment .reply_link").click(function() {
    $(this).parents(".comment").find(".new_comment").slideToggle();
    return false;
  });
});