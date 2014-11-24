class AddConversationIdToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :conversation, index: true
    add_reference :messages, :user, index: true
  end
end
