class CreateBlogLinks < ActiveRecord::Migration
  def self.up
    create_table :blog_links do |t|
      t.string :link
      t.integer :user_id
      t.integer :conversation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :blog_links
  end
end
