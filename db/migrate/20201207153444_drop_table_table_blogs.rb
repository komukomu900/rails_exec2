class DropTableTableBlogs < ActiveRecord::Migration[5.2]
  def change
    drop_table :table_blogs
  end
end
