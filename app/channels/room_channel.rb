class RoomChannel < ApplicationCable::Channel
  def subscribed
    #stream_from "room_channel"
    stream_from "room_channel_#{params['room']}" 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # jsで実行されたspeakのmessageを受け取り、room_channelのreceivedにブロードキャストする,ブロードキャストとは同じネットワーク内にいる全員に同じデータを送ること
    #ActionCable.server.broadcast 'room_channel', message: data['message']
    #Message.create! content: data['message']
    #メッセージを保存する際にuser情報などと紐づけ
    #Message.create! content: data['message'], user_id: current_user.id, room_id: params['room']
    puts "ooooooooooooo"
    Message.create! content: data['message'], room_id: params['room']
  end
end
