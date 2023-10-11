class AddContentToChats < ActiveRecord::Migration[6.1]
  def change
    add_column :chats, :content, :string
  end
end
