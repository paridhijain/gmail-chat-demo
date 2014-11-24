class MessagesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    get_all_messages
  end
 
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!
 
    @path = conversation_path(@conversation)
  end

  
  #def create
    #@message = Message.create!(message_params)
    #PrivatePub.publish_to("/messages/new", "alert('#{@message.content}');")
    #get_all_messages
  #end
  
  private
  
  def message_params
    params.require(:message).permit(:content)
  end
  
  def get_all_messages
    @messages = Message.all
  end
  
end
