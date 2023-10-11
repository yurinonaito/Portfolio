class AddTeachmesCountToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :teachmes_count, :integer, default: 0
  end
end
