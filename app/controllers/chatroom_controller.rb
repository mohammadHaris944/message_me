class ChatroomController < ApplicationController
before_action :require_user
    def index
        @message=Message.new
        #@messages=Message.all  #rail from Message will render partial of name message by naming convention 225 video
        @messages = Message.custom_display
    
    end
end