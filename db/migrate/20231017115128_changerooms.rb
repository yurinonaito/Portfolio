class Changerooms < ActiveRecord::Migration[6.1]
  def up
    remove_reference :rooms, :uesr, null: false
    add_column :rooms, :user_a_id, :integer
    add_column :rooms, :user_b_id, :integer
  end
  
  def down
    add_reference :rooms, :uesr
    remove_column :rooms,:user_a_id, :integer
    remove_column :rooms,:user_b_id, :integer
  end
end
