class AddNullToBlogs < ActiveRecord::Migration[6.1]
  def change
    change_column :blogs, :topic_id, :integer, :null => true
  end
end
