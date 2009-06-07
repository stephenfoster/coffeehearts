class CreateTextBlocks < ActiveRecord::Migration
  def self.up
    create_table :text_blocks do |t|
      t.text :note
      t.integer :user_id
      t.integer :conversation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :text_blocks
  end
end
