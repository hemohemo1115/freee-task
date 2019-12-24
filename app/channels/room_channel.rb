class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # jsで実行されたspeakのmessageを受け取り、room_channelのreceivedにブロードキャストする,ブロードキャストとは同じネットワーク内にいる全員に同じデータを送ること
    ActionCable.server.broadcast 'room_channel', message: data['message']
  end
end
