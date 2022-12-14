class MessagesController < ApplicationController
    before_action :authenticate_user!
  
    def index
      messages = Message.all
      messages_array = messages.map do |message|
        {
          id: message.id,
          user_id: message.user.id,
          name: message.user.name,
          content: message.content,
          email: message.user.email,
          ## ======= π γγγγε€ζ΄γγ =======
          created_at: message.created_at,
          likes: message.likes.map { |like| { id: like.id, email: like.user.email }  }
          ## ====== π γγγΎγ§ε€ζ΄γγ =======
        }
      end
  
      render json: messages_array, status: 200
    end
  end
  