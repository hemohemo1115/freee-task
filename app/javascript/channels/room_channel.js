import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  // room_channel.rbでブロードキャストされたものがここに届く
  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    return alert(data['message']);
  },

  // これが実行されるとコンシューマになったRoomChannel#speak({ message: message })が呼ばれる
  speak: function(message) {
    return this.perform('speak', {
      message: message
    });
  },
});
