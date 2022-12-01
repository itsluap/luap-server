var username = '';
var picture = '';
var image = '';
var message = '';
var zoomLevel = 1.0
var notificationsEnabled = true;
let allEmotes = {
 ':smile:': '😄', ':joy:': '😂', ':heart_eyes:': '😍', ':sob:': '😭', ':rolling_eyes:': '🙄', ':weary:': '😩', ':thinking:': '🤔', ':blush:': '😊', ':skull:': '💀', ':unamused:': '😒', ':kissing_heart:': '😘', ':relieved:': '😌', ':sleeping:': '😴', 's_smile:': '😅', ':eyes:': '👀', ':smirk:': '😏', ':sunglasses:': '😎', ':devil:': '😈', ':flushed:': '😳', ':grin:': '😁', ':pensive:': '😔', ':pray:': '🙏', ':stuck_out_tongue:': '😛', ':hug:': '🤗', ':tired:': '😫', ':confused:': '😕', ':tongue_wink:': '😜', ':innocent:': '😇', ':raised_hands:': '🙌', ':cry:': '😢', ':heart_eyes_cat:': '😻', ':yum:': '😋', ':wink:': '😉', ':slight_smile:': '🙂', ':goat:': '🐐', ':sleepy:': '😪', ':crown:': '👑', ':heart:': '❤️', ':ok:': '👌', ':tongue:': '👅', ':ring:': '💍', ':kiss:': '💋', ':mask:': '😷', ':money_face:': '🤑', ':scream:': '😱', ':flex:': '💪', ':v:': '✌️', ':poo:': '💩', ':fist:': '✊', ':cold_sweat:': '😰', ':ghost:': '👻', ':nerd:': '🤓', ':bikini:': '👙', ':hurt:': '🤕', ':lipstick:': '💄', ':nails:': '💅', ':point_up:': '☝️', ':wave:': '👋', ':thumb_down:': '👎', 'thumb_up': '👍', ':shock:': '😮', ':vulcan:': '🖖', ':call_me:': '🤙', ':clown:': '🤡', ':vomit:': '🤮', ':rainbow:': '🌈'
}

$(function() {
 window.addEventListener('message', function(event) {
  var data = event.data;
  if (data.type == 'show') {
   $('body').fadeIn(500);
   $('#phone').css('zoom', 1.0);
   $('#zoomLevel').val(zoomLevel);
  } else if (data.type == 'loadAccount') {
   username = data.username;
   picture = data.picture;
   $('#username2').val(username);
   $('#picture2').val(picture);
   $('#signUp').hide();
   $('#settings').hide();
   $('#feed').show();
   $('#profilePicture').attr('src', picture);
  } else if (data.type == 'loadFeed') {
    $("#feedList").empty();
   for (let i = 0; i < data.feed.length; i++) {
    const element = data.feed[i];
    var image = ''
    var time = 0
    var message = ''

    message = element.message

    if (element.time < 60) {
     time = Math.round(element.time) + 'm ago'
    } else if (element.time > 60 && element.time < 1441) {
      time = Math.round(element.time/60) + 'h ago'
    } else if (element.time > 1440) {
      time = Math.round(element.time/1440) + 'd ago'
    }

    if (element.image.length > 0) {
     image = "<img src='" + element.image + "' style='margin-top: 2.5%; width: 100%;'>"
    }

    for (let emoteId of Object.keys(allEmotes)) {
     var emote = allEmotes[emoteId];
     if (message.match(emoteId)) {
      message = message.replace(emoteId, emote);
     }
    }  

    $("#feedList").append("<div class='feed'><div class='feed-head'><div class='feed-image'><img src='" + element.picture  + "' alt='avatar' /></div><div class='feed-author'><div class='name'>" + element.username + "</div><div class='time'>" + time + "</div></div></div><div style='margin-top: 2.5%; margin-bottom: 0%;'><p id='feed-text' style='margin-bottom: 0%;'>" + message + "</p>" + image + "</div></div>");
   }
  } else if (data.type == 'updateTime') {
   if (data.useRealtime) {
    var convertedTime = moment.tz(moment(), data.useTimezone).format('HH:mm')
    $("#time").html(convertedTime);
   } else {
    $("#time").html(data.time);
   }
  } else { 
   $('body').fadeOut(500);
  }
 });

 $('#username').on('input', function() {
  var text = $(this).val();
  if (text.length > 0) {
   username = text;
  }
 });

 $('#picture').on('input', function() {
  var text = $(this).val();
  if (text.match(/\.(jpeg|jpg|png|gif)/g) != null) {
   $('#profilePic').html("<img width='225' style='border-radius:50%;' src='" + text + "'/>");
   picture = text;
  }
 });

 $('#username2').on('input', function() {
  var text = $(this).val();
  if (text.length > 0) {
   username = text;
  }
 });

 $('#picture2').on('input', function() {
  var text = $(this).val();
  if (text.match(/\.(jpeg|jpg|png|gif)/g) != null) {
   picture = text;
  }
 });

 $('#createAccount').click(function(){
  if (picture.match(/\.(jpeg|jpg|png|gif)/g) != null) {
   if (username.length > 0) { 
    $.post('http://power_encryptedChat/createAccount', JSON.stringify({username: username, picture: picture}));
   } 
  }
 });

 $('#imageURL').on('input', function() {
  var text = $(this).val();
  if (text.match(/\.(jpeg|jpg|png|gif)/g) != null) {
   image = text;
  }
 });

 $('#notifications').on('change', function() {
  if (this.value == 'true') { 
   notificationsEnabled = true;
  } else {
   notificationsEnabled = false;
  }
 });

 $('#feedMessage').on('input', function() {
  var text = $(this).val();
  message = text;
 });

 $('#addImagePromt').click(function(){
  if ($('#imagePromt').is(':visible')) {
   $('#imagePromt').hide();
   image = '';
  } else {
   $('#imagePromt').show();
  }
 });

 $('#sendMessage').click(function(){
  if (message.length > 0) {
   var newMessage = message.replace(/<.*?script.*?>.*?<\/.*?script.*?>/igm, '')
   $.post('http://power_encryptedChat/postMessage', JSON.stringify({username: username, picture: picture, message: newMessage, image: image}));

   message = '';
   image = '';

   $("#feedMessage").val('');
   $("#imageURL").val('');
   $('#imagePromt').hide();
  }
 });

 $('#increaseZoom').click(function(){
  if (zoomLevel < 1.5) {
   zoomLevel = zoomLevel + 0.1
   $('#zoomLevel').val(zoomLevel.toFixed(1));
   $('#phone').css('zoom', zoomLevel.toFixed(1));
  }
 });

 $('#decreaseZoom').click(function(){
  if (zoomLevel > 0.6) {
   zoomLevel = zoomLevel - 0.1
   $('#zoomLevel').val(zoomLevel.toFixed(1));
   $('#phone').css('zoom', zoomLevel);
  }
 });
 
 $('#saveSettings').click(function(){
  $.post('http://power_encryptedChat/saveSettings', JSON.stringify({username: username, picture: picture, zoom: zoomLevel.toFixed(1), notificationsEnabled: notificationsEnabled}));
 });

 $('#saveSettings2').click(function(){
  $.post('http://power_encryptedChat/saveSettings', JSON.stringify({username: username, picture: picture, zoom: zoomLevel.toFixed(1), notificationsEnabled: notificationsEnabled}));
 });

 $('#saveSettings3').click(function(){
  $.post('http://power_encryptedChat/saveSettings', JSON.stringify({username: username, picture: picture, zoom: zoomLevel.toFixed(1), notificationsEnabled: notificationsEnabled}));
 });

 
 $('#backToFeed').click(function(){
  $('#signUp').hide();
  $('#settings').hide();
  $('#feed').show();
 });

 $('#settingsCog').click(function(){
  $('#signUp').hide();
  $('#feed').hide();
  $('#settings').show();
  $('#imagePromt').hide();
 });

 document.onkeydown = function(data) {
  if (data.which == 27) {
   $("body").fadeOut(100);
   $.post('http://power_encryptedChat/close')
  }
 }
});
