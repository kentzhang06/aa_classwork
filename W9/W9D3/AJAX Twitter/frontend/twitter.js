const FollowToggle = require("./follow_toggle.js");

$(() => {
  $("button.follow-toggle").each((idx, el) => {
    new FollowToggle(el);

  })
})




// $("li").each(function (index) {
//     console.log(index + ": " + $(this).text());
// });
