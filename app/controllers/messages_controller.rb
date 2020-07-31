class MessagesController < ApplicationController
    before_action :require_user

    def create
        message = current_user.messages.build(message_params)
        if message.save
          redirect_to root_path
          ActionCable.server.broadcast "chatroom_channel",
                                        mod_message: message_render(message)
        end
    end

    private

    def message_params
        params.require(:message).permit(:body)
    end
    def message_render(message)
        #here we are rendering partials
        render(partial: 'message', locals: {message: message})  #here first message blue means that in our partial message is require first message is for partial and second message we are passing from here  to partial object
    end

end

