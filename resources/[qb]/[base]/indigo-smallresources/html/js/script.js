window.addEventListener('message', function(event) {
    switch(event.data.action) {
        case "togglexhair":
         ToggleDot(event.data);
         break;
    }
})

ToggleDot = function(data) {
  if (data.show) {
      $(".Dot-Container").css("display", "block");
  } else {
      $(".Dot-Container").css("display", "none");
  }
}