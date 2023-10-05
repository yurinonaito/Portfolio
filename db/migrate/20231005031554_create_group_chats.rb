class CreateGroupChats < ActiveRecord::Migration[6.1]
  def change
    create_table :group_chats do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group_room, null: false, foreign_key: true
      t.text :message, null: false

      t.timestamps
    end
  end
end
