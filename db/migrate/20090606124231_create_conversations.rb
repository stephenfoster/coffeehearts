class CreateConversations < ActiveRecord::Migration
  def self.up
    create_table :conversations do |t|
      t.integer :relationship_id
      t.integer :user_id
      t.string :topic

      t.timestamps
    end
  end

  def self.down
    drop_table :conversations
  end
end
