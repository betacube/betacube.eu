$(document).ready(function() {
  replace_team_list_items("email");
  replace_team_list_items("linkedin");
  replace_team_list_items("facebook");
  replace_team_list_items("twitter");

  $('.carousel').carousel({
    interval: 3500
  })

});

function replace_team_list_items(item) {
  $('li.' + item).each(function(li) {
    $(this).addClass("team-contact-icon");
    $(this.children).html('<img src="/assets/icons/' + item + '.png" />');
  });
}

