$(document).on('click', '#ping-send', function(e){
    e.preventDefault();
    var IDPlayer = $(".ierplol").val();
    if (IDPlayer >= 1){
        $.post('https://indigo-phone/SendPingPlayer', JSON.stringify({
            id: IDPlayer
        }));
        $(".ierplol").val("");
    }
});