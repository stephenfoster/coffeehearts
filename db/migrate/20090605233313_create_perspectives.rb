class CreatePerspectives < ActiveRecord::Migration
  def self.up
    create_table :perspectives do |t|
      t.string :name
      t.text :description
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.integer :user_id
      t.integer :relationship_id

      t.timestamps
    end
  end

  def self.down
    drop_table :perspectives
  end
end
