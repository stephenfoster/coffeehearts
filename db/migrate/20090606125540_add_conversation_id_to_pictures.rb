class AddConversationIdToPictures < ActiveRecord::Migration
  def self.up
    add_column :pictures, :conversation_id, :integer
  end

  def self.down
    add_column :pictures, :conversation_id
  end
end
