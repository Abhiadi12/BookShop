class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    if current_user.id == 2
      User.where.not(id: 2).each do|user|
        stream_from "messages:#{user.subscription.chat_id}"
      end
    else
      stream_from "messages:#{current_user.subscription.chat_id}"
    end
    #stream for each user chat room subcription
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
