$(document).ready(function() {
  replace_team_list_items("email");
  replace_team_list_items("linkedin");
  replace_team_list_items("facebook");
  replace_team_list_items("twitter");

  $('.carousel').carousel({
    interval: 3500
  })
  
  $("dl.speakers dt.name").each(function() {
    $(this).click(function(e) {
      bio_name = $(this).attr("id");
      $("dl.speakers dd.bio." + bio_name).toggle();
    });
  });

});

function replace_team_list_items(item) {
  $('li.' + item).each(function(li) {
    $(this).addClass("team-contact-icon");
    $(this.children).html('<img src="/assets/icons/' + item + '.png" />');
  });
}