class CreateGroupEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :group_entries do |t|
      t.references :user
      t.references :group_room

      t.timestamps
    end
  end
end
