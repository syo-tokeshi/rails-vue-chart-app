class RoomChannel < ApplicationCable::Channel

  # ブラウザ側とコネクションが確立されると、呼び出される
  def subscribed
    stream_from 'room_channel'
  end

  # コネクションが切断されると呼び出される
  def unsubscribed
  
  end

  ## ユーザーが、サーバーにリスエストを送ると、呼び出される
  def receive(data)
    user = User.find_by(email: data['email'])
    
    if message = Message.create(content: data['message'], user_id: user.id)
      # 受け取った内容を、全てのユーザーに返す
      ActionCable.server.broadcast 'room_channel', { message: data['message'], name: user.name, created_at: message.created_at }
    end
  end
  ## ====== 👆 ここまで追加する=======
end
