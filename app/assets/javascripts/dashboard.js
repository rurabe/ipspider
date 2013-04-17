$(document).ready(function(){
  var pusher = new Pusher('f9a66c6497100ceb385c');
  var channelId = $('#channel').attr('value');
  var channel = pusher.subscribe(channelId);

  channel.bind('task', function(data) {
    $('#tasks').prepend('<li>' + data.ip + ' - ' + data.title + ' - ' + data.url + '</li>');
  });
});
