class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.integer :relationship_id
      t.string :image_file_name, :string
      t.string :image_content_type, :string
      t.string :image_file_size, :integer
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
