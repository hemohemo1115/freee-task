import consumer from "./consumer"

const chatChannel = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  // room_channel.rbでブロードキャストされたものがここに届く
  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    //console.log(data);
    //alert("hoge")
    return $('#messages').append(data['message']);
  },

  // これが実行されるとコンシューマになったRoomChannel#speak({ message: message })が呼ばれる
  speak: function(message) {
    
    //console.log(message);
    return this.perform('speak', {
      message: message
    });
  },
});

$(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
  if (event.keyCode === 13) {
    chatChannel.speak(event.target.value);
    event.target.value = '';
    return event.preventDefault();
  }
});
